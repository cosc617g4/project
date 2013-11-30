class MarathonsController < ApplicationController

	def index
		if(current_user == nil)
			redirect_to new_user_session_path
		elsif(current_user.admin?)
			@marathons = Marathon.find(:all)
		else
			redirect_to root_path
		end

	end
	def add
		if(current_user == nil)
			redirect_to new_user_session_path
		elsif(current_user.admin?)
			@marathon = Marathon.new
		else
			redirect_to root_path
		end
	end

	def create 
		@marathon = Marathon.new(params[:marathon])
		respond_to do |format|
			if @marathon.save
				format.html { redirect_to admins_marathon_path,
					notice: "Marathon #{@marathon.name} was successfully created"}
				format.json { render json: @marathon,
					status: :created, location: @marathon }
			else
				format.html { render action: "add"}
				format.json { render json: @marathon.errors} 
			end
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
