class NewsfeedController < ApplicationController
  def main
    if( !user_signed_in? )
      redirect_to new_user_session_path
    end
    require 'feedzirra'
    #get the latest database updates from their friends trainings
    @feed = Feedzirra::Feed.fetch_and_parse("http://www.runnersworld.com/feeds/runners-world-feed")
    @entries = @feed.entries
    
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
