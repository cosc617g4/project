class MessagesController < ApplicationController
  def index
    if (current_user == nil)
      redirect_to new_user_session_path
    else
      @messages = current_user.received_messages
      @namecolumn = "From"
      @controllermethod = "index"
      #@nametodisplay = tempname.first_name + ' ' + tempname.lastname
    end
  end

  def outbox
    if (current_user == nil)
      redirect_to new_user_session_path
    else
      @messages = current_user.sent_messages
      @namecolumn = "To"
      @controllermethod = "outbox"
    end
  end

  def show
    if (current_user == nil)
      redirect_to new_user_session_path
    else
      @message = current_user.messages.find(params[:message])
      @message.mark_as_read
    end
  end

  def reply
    if (current_user == nil)
      redirect_to new_user_session_path
    else
      @message = current_user.messages.find(params[:message])

      @from = User.find_by_id(@message.from)
      @topic = @message.topic
      @replysubject = 'Re: ' + @topic

      temp = DateTime.parse("2011-05-19 10:30:14")
      formatted_date = temp.strftime('%a %b %d %H:%M:%S %Z %Y')

      @bodyvalue = "\n\n\n\n-------------------------------------------------------\nOrginal message received \n" + formatted_date + @message.body
    end
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

    redirect_to messages_path
  end
  
  def deletefromuser
    #if the destroy method above is called the entire message is deleted instead of just the message from the user inbox/outbox
    #must make a custom delete method so that the message is only remove from one user not all
    current_user.delete_message(params[:message])
    redirect_to messages_path
  end

end
