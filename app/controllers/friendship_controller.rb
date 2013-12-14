class FriendshipController < ApplicationController
  #autocomplete :user, :email
  def request_friend
    # initialize 
    friend_id = params[:friend_id]
    temp = current_user
    
    # create friendship
    fr = Friendrequest.new
    fr.request_id = temp.id
    fr.receive_id = friend_id
    fr.fr_status = 1
    
    if fr.save
      #flash[:notice] = "Added friend"
      redirect_to :action => 'index', :alert => "Sent a request"
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
    #friend_deleted = current_user.friendships.find(:all, :conditions => {:friend_id => friend_id})
    #friendships.find(:all, :conditions => {:user_id => current_user.id, :friend_id => params[:friend_id]})
    if current_user.friendships.find(:first, :conditions => {:friend_id => friend_id}).destroy
      #flash[:notice] = "Removed friendship."
      redirect_to :action => 'show', :alert => "Deleted friend"
    else
      redirect_to :action => 'show', :alert => "Unable to delete friend"
    end
  end
  
  def index
    login_user = current_user
    if (login_user == nil)
      redirect_to new_user_session_path
    else
      #login_user = current_user
      #find current user's friend request list
      request_id = Friendrequest.find(:all, :conditions => {:receive_id => login_user.id, :fr_status => 1})
      #request_id = User.find(login_user.id).friendrequests
      request_ids = Array.new
      for temp in request_id
        request_ids.push(temp.request_id)
      end
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
    end
    @friends = User.find(:all)
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
    temp.fr_status = 3
    temp.save
    
    if create(temp.request_id)
      redirect_to :action => 'index', :alert => "Added a friend"
    else
      redirect_to :action => 'index', :alert => "Unable to add friend"
    end
  end
  
  def decline
  end
end
