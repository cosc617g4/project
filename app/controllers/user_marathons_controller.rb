class UserMarathonsController < ApplicationController
  def index
    if (current_user == nil)
      redirect_to new_user_session_path
    else
      @usermarathons = UserMarathon.where(user_id: current_user.id)
    end
  end
  
  def new
    if (current_user == nil)
      redirect_to new_user_session_path
    else
      
      @marathon = Marathon.find(params[:marathon])
      
      @usermarathon = UserMarathon.new
      @usermarathon.marathon_id = @marathon.id
      #@usermarathon.user_id = current_user.id
      
    end
  end
  
  def edit
    if (current_user == nil)
      redirect_to new_user_session_path
    else
      @usermarathon = UserMarathon.find(params[:id])
    end 
  end
  
  def update
    @usermarathon = UserMarathon.find(params[:id])
    
    respond_to do |format|
      if @usermarathon.update_attributes(params[:user_marathon])
        format.html { redirect_to user_marathons_path, notice: 'Event has been successfully updated.'}
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @training.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def create
    @usermarathon = UserMarathon.new(params[:user_marathon])
    @usermarathon.user_id = current_user.id
    #@usermarathon.marathon_id = 2
    
    respond_to do |format|
      if @usermarathon.save
        string = 'Marathons added to your events.'
        
        format.html { redirect_to user_marathons_path, notice: string}
      else
        format.html { render action: "new" }
        format.json { render json: @usermarathon.errors, status: :unprocessable_entity }
      end
    end
  end
end
