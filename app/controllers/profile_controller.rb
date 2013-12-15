class ProfileController < ApplicationController
  def index
    if (current_user == nil)
      redirect_to new_user_session_path
    else
      if (params[:user_id].nil?)
        @user = current_user
      else
        @user = User.find(params[:user_id])
      end

      users_fullname = @user.fullname

      tempPosts = Array.new

      usermarathons = UserMarathon.where(user_id: @user.id)
      usermarathons.each do |um|
        marathon = Marathon.find(um.marathon_id)

        minuteString = String.new
        minutes = um.minutes
        if minutes < 10
          minuteString = "0" + minutes.to_s
        else
        minuteString = minutes.to_s
        end

        message = users_fullname + " ran the " + marathon.name + " and placed " + um.place.to_s +
        " with a time of " + um.hours.to_s + ":" + minuteString

        post = Post.new
        post.updated_at = um.updated_at
        post.message = message

        tempPosts.push(post)
      end

      trainings = current_user.trainings
      trainings.each do |training|

        minuteString = String.new
        minutes = training.minutes
        if minutes < 10
          minuteString = "0" + minutes.to_s
        else
        minuteString = minutes.to_s
        end

        message = users_fullname + " completed " + training.hours.to_s + ":" + minuteString+ " of training on " +
        training.date.strftime("%a %m/%d/%Y") + " and ran a distance of " + training.distance.to_s + ".  " + @user.first_name + " added the following details about the run. "

        post = Post.new

        post.updated_at = training.updated_at
        post.message = message
        tempPosts.push(post)
      end

      friendships = Friendship.where("user_id = ?", @user.id)
      friendships.each do |friendship|

        friend = User.find(friendship.friend_id )

        message = users_fullname + " and <a href=\"/profile/index?user_id=" + friend.id.to_s + "\">" + friend.fullname + "</a> are now friends."

        #photo = Photo.find()

        post = Post.new

        post.updated_at = friendship.updated_at
        post.message = message
        post.photo_id = friend.default_photo_id
        post.user_id = @user.id
        post.friend_id = friend.id

        tempPosts.push(post)
      end

      photos = @user.photos
      photos.each do |photo|

        message = users_fullname + " uploaded a photo."

        post = Post.new
        post.updated_at = photo.updated_at
        post.message = message
        post.photo_id = photo.id

        tempPosts.push(post)

        photocomments = photo.comments
        photocomments.each do |comment|

          if comment.user_id != @user.id

            commenter = User.find(comment.user_id)

            message = "<a href=\"/profile/index?user_id=" + commenter.id.to_s + "\">" + commenter.fullname + "</a> commented on " + @user.fullname + "'s photo.</br>" +
            comment.message

            post = Post.new
          post.updated_at = comment.updated_at
          post.message = message
          post.photo_id = photo.id

          tempPosts.push(post)
          end
        end

      end

      comments = @user.comments
      comments.each do |comment|

        photo = Photo.find(comment.photo_id)
        photosOwner = User.find(photo.user_id)

        message = users_fullname + "  commented on <a href=\"/profile/index?user_id=" + photosOwner.id.to_s + "\">" + photosOwner.fullname + "</a>.</br>" + comment.message

        post = Post.new
        post.updated_at = comment.updated_at
        post.message = message
        post.photo_id = photo.id
        post.user_id = @user.id
        post.friend_id = photosOwner.id

        tempPosts.push(post)

      end

      tempPosts.sort_by{|e| e[:updated_at]}

      sorted = tempPosts.reverse
      @posts = sorted[0,49]
    end
  end
end
