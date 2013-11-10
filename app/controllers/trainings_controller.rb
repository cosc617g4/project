class TrainingsController < ApplicationController
  def index
    @trainings = Training.where(user_id: current_user.id).order("date DESC")
  end

  def new
  end

  def edit
  end

  def update
  end

  def show
  end
end
