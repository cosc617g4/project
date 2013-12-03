class UserMarathonsController < ApplicationController
  def index
    if (current_user == nil)
      redirect_to new_user_session_path
    else
      @usermarathons = UserMarathon.where(user_id: current_user.id)
    end
  end
end
