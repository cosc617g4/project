class AdminsController < ApplicationController
	def index
		if(current_user == nil)
			redirect_to new_user_session_path
		end

		if(!current_user.admin?)
			redirect_to root_path
		end

	end

	def marathon
		
	end
end
