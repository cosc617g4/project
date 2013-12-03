class ProfileController < ApplicationController
  def index
    if (current_user == nil)
      redirect_to new_user_session_path
    else
      @user = current_user
    end
  end
end
