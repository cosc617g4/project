class MessagesController < ApplicationController
  
  def index
    @messages = current_user.received_messages
  end

  def outbox
    @messages = current_user.sent_messages
  end

  def show
    @message = current_user.messages.find(params[:id])
  end
  
  def reply
    
  end

  def destroy
    @message = current_user.messages.find(params[:id])
    if @message.destroy
      flash[:notice] = "All ok"
    else
      flash[:error] = "Fail"
    end
  end

  def new
    @message = ActsAsMessageable::Message.new
    
    #find current user's friend list
    friends_id = User.find(current_user.id).friendships
    friend_ids = Array.new
    for temp in friends_id
      friend_ids.push(temp.friend_id)
    end
     #find the friends' information from users table
    @friends = User.find(:all, :conditions => {:id => friend_ids})
  end

  def create
    @to = User.find_by_email(params[:acts_as_messageable_message][:to])
    current_user.send_message(@to, params[:acts_as_messageable_message][:topic], params[:acts_as_messageable_message][:body])
  end
  
end
