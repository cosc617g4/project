class FriendshipController < ApplicationController
  def create
  
    # initialize 
    friend_id = params[:friend_id]
    temp = current_user
    
    # create friendship
    friendship = Friendship.new
    friendship.user_id = temp.id
    friendship.friend_id = friend_id
    
    if friendship.save
      #flash[:notice] = "Added friend"
      redirect_to :action => 'index', :alert => "Added friend"
    else
      redirect_to :action => 'index', :alert => "Unable to add friend"
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
    
    #find current user's friend list
    friends_id = User.find(current_user.id).friendships
    friend_ids = Array.new
    for temp in friends_id
      friend_ids.push(temp.friend_id)
    end
     #find the friends' information from users table
    @friends = User.find(:all, :conditions => {:id => friend_ids})
    
  end

  def new
    if params[:result].nil?
      @results = nil
    else
      @results = User.find(:all, :conditions => {:id => params[:result]})
    end
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
  end
end
