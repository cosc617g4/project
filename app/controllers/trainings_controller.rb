class TrainingsController < ApplicationController
  def index
    if (current_user == nil)
      redirect_to new_user_session_path
    else
      @trainings = Training.where(user_id: current_user.id).order("date DESC")
    end
  end

  def new
    if (current_user == nil)
      redirect_to new_user_session_path
    else
      @training = Training.new
    end
  end

  def edit
    if (current_user == nil)
      redirect_to new_user_session_path
    else
      @training = Training.find(params[:id])
    end
  end

  def show
  end

  def update
    @training = Training.find(params[:id])

    respond_to do |format|
      if @training.update_attributes(params[:training])
        format.html { redirect_to trainings_path, notice: 'Training entry was successfully updated. '}
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @training.errors, status: :unprocessable_entity }
      end
    end
  end

  def create
    @training = Training.new(params[:training])
    @training.user_id = current_user.id

    respond_to do |format|
      if @training.save
        string = "Training was successfully created."
        string << @training.date
        
        format.html { redirect_to trainings_path, notice: string}
      else
        format.html { render action: "new" }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    if (current_user == nil)
      redirect_to new_user_session_path
    else
      @training = Training.find(params[:id])
      @training.destroy

      respond_to do |format|
        format.html { redirect_to trainings_path }
        format.json { head :no_content }
      end
    end
  end
end
