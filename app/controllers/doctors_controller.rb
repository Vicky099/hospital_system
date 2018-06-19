class DoctorsController < ApplicationController
  layout "application"

  def index
    @hospitals = current_doctor.hospitals
  end

  def new

  end

  def create
  end

  def edit
  end

  def update
  end

  def show
  end

  def destroy
  end

  private
  def doctor_params

  end

end
