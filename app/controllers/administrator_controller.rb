class AdministratorController < ApplicationController
  def index
		if(current_user == nil)
			redirect_to new_user_session_path
		elsif(!current_user.admin?)
			redirect_to root_path
		else
		end	

	end

	def marathon
		
	end
end
