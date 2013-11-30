class MarathonsController < ApplicationController

	def add
		if(current_user == nil)
			redirect_to new_user_session_path
		elsif(current_user.admin?)
			@marathon = Marathon.new
		else
			redirect_to root_path
		end
	end

	def list
		if(current_user == nil)
			redirect_to new_user_session_path
		elsif(current_user.admin?)
			@marathons = Marathon.
		else
			redirect_to root_path
		end

	end
end
