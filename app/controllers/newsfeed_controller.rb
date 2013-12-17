class NewsfeedController < ApplicationController
  def main
    if( !user_signed_in? )
      redirect_to new_user_session_path
    else
=begin
    require 'feedzirra'
    #get the latest database updates from their friends trainings
    @feed = Feedzirra::Feed.fetch_and_parse("http://www.runnersworld.com/feeds/runners-world-feed")
    @entries = @feed.entries
=end
      tempPosts = Array.new

      friendIDs = Array.new

      friendships = Friendship.where("user_id = ?", current_user.id)
      friendships.each do |friendship|
        friendIDs.push(friendship.friend_id)
      end

      #get all the marathons that friends ran
      usermarathons = UserMarathon.where(:user_id => friendIDs)
      usermarathons.each do |um|
        marathon = Marathon.find(um.marathon_id)
        runner = User.find(um.user_id)

        minuteString = String.new
        minutes = um.minutes
        if minutes < 10
          minuteString = "0" + minutes.to_s
        else
        minuteString = minutes.to_s
        end

        message = "<a href=\"/profile/index?user_id=" + runner.id.to_s + "\">" + runner.fullname + "</a> ran the " + marathon.name + " and placed " + um.place.to_s +
        " with a time of " + um.hours.to_s + ":" + minuteString

        post = Post.new
        post.updated_at = um.updated_at
        post.message = message
        post.photo_id = runner.default_photo_id

        tempPosts.push(post)
      end

      #get all the recently formed friendships
      friendships = Friendship.where(:user_id => friendIDs)
      friendships.each do |friendship|

        friend = User.find(friendship.user_id )
        friendOfFriend = User.find(friendship.friend_id )

        message = "<a href=\"/profile/index?user_id=" + friend.id.to_s + "\">" + friend.fullname + "</a> and <a href=\"/profile/index?user_id=" + friendOfFriend.id.to_s + "\">" + friendOfFriend.fullname + "</a> are now friends."

        #photo = Photo.find()

        post = Post.new

        post.updated_at = friendship.updated_at
        post.message = message

        if !Photo.where(:id => friendOfFriend.default_photo_id).blank?
          post.photo_id = friendOfFriend.default_photo_id
        end
        
        post.user_id = friend.id
        post.friend_id = friend.id

        tempPosts.push(post)
      end

      #get all the recently added photos by friends
      photos = Photo.where(:user_id => friendIDs)
      photos.each do |photo|

        friend = User.find(photo.user_id )
        message = "<a href=\"/profile/index?user_id=" + friend.id.to_s + "\">" + friend.fullname + "</a> uploaded a photo."

        post = Post.new
        post.updated_at = photo.updated_at
        post.message = message
        post.photo_id = photo.id

        tempPosts.push(post)

        photocomments = photo.comments
        photocomments.each do |comment|

          if comment.user_id != friend.id

            commenter = User.find(comment.user_id)

            message = "<a href=\"/profile/index?user_id=" + commenter.id.to_s + "\">" + commenter.fullname + "</a> commented on <a href=\"/profile/index?user_id=" + friend.id.to_s + "\">" + friend.fullname +
            "</a>'s photo.</br>" + comment.message

            post = Post.new
          post.updated_at = comment.updated_at
          post.message = message
          post.photo_id = photo.id

          tempPosts.push(post)
          end
        end

      end

      #get all the comments of friends
      comments = Comment.where(:user_id => friendIDs)
      comments.each do |comment|

        commenter = User.find(comment.user_id)
        photo = Photo.find(comment.photo_id)
        photosOwner = User.find(photo.user_id)

        message = "<a href=\"/profile/index?user_id=" + commenter.id.to_s + "\">" + commenter.fullname + "</a> commented on <a href=\"/profile/index?user_id=" + photosOwner.id.to_s + "\">" + photosOwner.fullname + "</a>.</br>" + comment.message

        post = Post.new
        post.updated_at = comment.updated_at
        post.message = message
        post.photo_id = photo.id
        post.user_id = commenter.id
        post.friend_id = photosOwner.id

        tempPosts.push(post)

      end

      tempPosts.sort_by{|e| e[:updated_at]}

      sorted = tempPosts.reverse
      @posts = sorted[0,49]
    end
  end

  def add
  end

  def remove
  end

  def block
  end

  def unblock
  end
end
