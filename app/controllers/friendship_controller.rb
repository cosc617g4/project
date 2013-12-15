class FriendshipController < ApplicationController
  #autocomplete :user, :email
  def request_friend
    # initialize 
    friend_id = params[:friend_id]
    temp = current_user
    
    if friend_id.to_i == temp.id
      redirect_to :action => 'index', :alert => "It's yourself. Cannot be added"
      return
    end
    
    if !Friendship.find(:all, :conditions => {:user_id => temp.id, :friend_id => friend_id}).first.nil?
      redirect_to :action => 'index', :alert => "Already Friend"
      return
    end
    
    # friend request that I sent
    fr = Friendrequest.find(:all, :conditions => {:request_id => temp.id, :receive_id => friend_id}).first
    # friend request that I received
    fr2 = Friendrequest.find(:all, :conditions => {:request_id => friend_id, :receive_id => temp.id}).first
    
    # haven't receive friend request before the person who I want
    if !fr.nil?
      # pending
      if fr.fr_status == 1
        redirect_to :action => 'index', :alert => "Already Sent a request before. Wait for the response"
        return
      # declined
      elsif fr.fr_status == 2
        fr.fr_status = 1
        msg = "Your request was declined. Sent a request again"
      # accepted
      elsif fr.fr_status == 3
        fr.fr_status = 1
        msg = "Sent a request"
      else
        redirect_to :action => 'index', :alert => "Error. Failed to send a request"
        return
      end
    elsif !fr2.nil?
      fr = fr2
      # pending
      if fr.fr_status == 1
        redirect_to :action => 'index', :alert => "Already receive a request before. Respond the request"
        return
      # declined
      elsif fr.fr_status == 2
        msg = "You declined the request before. Sent a request"
        fr = Friendrequest.new
        fr.request_id = temp.id
        fr.receive_id = friend_id
        fr.fr_status = 1
      # accepted
      elsif fr.fr_status == 3
        fr = Friendrequest.new
        fr.request_id = temp.id
        fr.receive_id = friend_id
        fr.fr_status = 1
        msg = "Sent a request"
      else
        redirect_to :action => 'index', :alert => "Error. Failed to send a request"
        return
      end
    else
      fr = Friendrequest.new
      fr.request_id = temp.id
      fr.receive_id = friend_id
      fr.fr_status = 1
      msg = "Sent a request"
    end
    
    # save
    if fr.save
      #flash[:notice] = "Added friend"
      redirect_to :action => 'index', :alert => msg
    else
      redirect_to :action => 'index', :alert => "Unable to send request"
    end
  end
  
  def create(friend_id)
    # initialize 
    #friend_id = params[:friend_id]
    temp = current_user
    
    # create friendship
    friendship = Friendship.new
    friendship.user_id = temp.id
    friendship.friend_id = friend_id
    friendship_reverse = Friendship.new
    friendship_reverse.user_id = friend_id
    friendship_reverse.friend_id = temp.id
    
    if friendship.save
      if friendship_reverse.save
        return true
      else
        return false
      end
    else
      return false
    end
  end
  
  def destroy
    friend_id = params[:friend_id]
    temp = current_user
    temp.friendships.find(:first, :conditions => {:friend_id => friend_id}).destroy
    Friendship.find(:first, :conditions => {:user_id => friend_id, :friend_id => temp.id}).destroy
        #flash[:notice] = "Removed friendship."
    redirect_to :action => 'show', :alert => "Deleted friend"
    
  end
  
  def index
    
    login_user = current_user
    if (login_user == nil)
      redirect_to new_user_session_path
    else
      #login_user = current_user
      #find current user's friend request list
      request_id = Friendrequest.find(:all, :conditions => {:receive_id => login_user.id, :fr_status => 1})
      request_ids = Array.new
      request_status = Array.new
      for temp in request_id
        request_ids.push(temp.request_id)
        request_status.push(temp.fr_status)
      end
      @requests_status = request_status
      #find the friends' information from users table
      @requests = User.find(:all, :conditions => {:id => request_ids})     
      ################################################################
      #find current user's friend list
      friends_id = User.find(login_user.id).friendships
      friend_ids = Array.new
      for temp in friends_id
        friend_ids.push(temp.friend_id)
      end
       #find the friends' information from users table
      @friends = User.find(:all, :conditions => {:id => friend_ids})
    end
  end

  def new
    if params[:result].nil?
      @results = nil
    else
      @results = User.find(:all, :conditions => {:id => params[:result]})
      #@results = params[:result]
    end
    #@friends = User.find(:all)
  end
  
  # Search friend
  def search
    result = User.find(:all, :conditions => {:email => params[:search_email]})
    redirect_to :controller => "friendship", :action => "new", :id => current_user.id, :result => result
  end

  def show
    #find current user's friend list
    friends_id = User.find(current_user.id).friendships
    friend_ids = Array.new
    for temp in friends_id
      friend_ids.push(temp.friend_id)
    end
     #find the friends' information from users table
    @friends = User.find(:all, :conditions => {:id => friend_ids})
  end
  
  def confirm
    temp = Friendrequest.find(:all, :conditions => {:request_id => params[:r_id], :receive_id => current_user.id}).first
    # accept a friend request
    temp.fr_status = 3
    temp.save
    
    if create(temp.request_id)
      redirect_to :action => 'index', :alert => "Accepted a friend"
    else
      redirect_to :action => 'index', :alert => "Error"
    end
  end
  
  def decline
    temp = Friendrequest.find(:all, :conditions => {:request_id => params[:r_id], :receive_id => current_user.id}).first
    # decline a friend request
    temp.fr_status = 2
    
    if temp.save
      redirect_to :action => 'index', :alert => "Declined a friend request"
    else
      redirect_to :action => 'index', :alert => "Error"
    end
  end
end
