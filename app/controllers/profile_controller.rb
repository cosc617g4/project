class ProfileController < ApplicationController
  def index
    if (current_user == nil)
      redirect_to new_user_session_path
    else
      @user = current_user
      
      tempPosts = Array.new
      
      usermarathons = UserMarathon.where(user_id: current_user.id)
      usermarathons.each do |um|
        marathon = Marathon.find(um.marathon_id)
        
        message = current_user.first_name + " " + current_user.last_name + " ran the " + marathon.name + " and place " + um.place.to_s + 
        " with a time of " + um.hours.to_s + ":" + um.minutes.to_s 
        
        post = Post.new
        post.updated_at = um.updated_at
        post.message = message
        
        tempPosts.push(post)
      end
      
      trainings = current_user.trainings
      trainings.each do |training|
        users_fullname = current_user.first_name + " " + current_user.last_name
        message = users_fullname + " completed " + training.hours.to_s + ":" + training.minutes.to_s + " of training on " + 
        training.date.strftime("%a %m%d%Y") + " and ran a distance of " + training.distance.to_s + ".  " + users_fullname + " added the following details about the run. "
        
        post = Post.new
         
        post.updated_at = training.updated_at
        post.message = message
        tempPosts.push(post)
      end
      tempPosts.sort_by &:updated_at
      
      @posts = tempPosts.reverse
    end
  end
end
