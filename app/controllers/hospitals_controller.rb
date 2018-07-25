class HospitalsController < ApplicationController
  before_action :authenticate_user!
  before_action :doctors_hospital, only:[:edit, :update]

  def index
    @hospitals = current_doctor.hospitals
  end

  def new
    @hospital = Hospital.new
  end

  def create
    @hospital = current_doctor.hospitals.build(hospital_params)
    if @hospital.save
      flash[:success] = "Hospital Added successfully"
      redirect_to doctors_path
    else
      flash[:alert] = "Something went wrong."
      render :new
    end
  end

  def show
    @hospital = current_doctor.hospitals.find_by_id(params[:id])
  end

  def edit
  end

  def update
    if @hospital.update_attributes(hospital_params)
      flash[:success] = "Hospital Info updated successfully."
      redirect_to doctors_path
    else
      flash[:alert] = "Something went wrong."
      render :edit
    end
  end

  def destroy
   	#@hospital = Hospital.find_by(id: params[:id])
    #if @hospital.destroy
      #flash[:success] = "Hospital data deleted successfully."
      #redirect_to hospitals_path
    #else
      #flash[:alert] = "Something went wrong."
      #redirect_to hospitals_path
    #end
  end

  private
  def hospital_params
    params.require(:hospital).permit(:name, :registration_num, :contact_num, :no_of_beds, :facilities, :address, :landmark, :type_of_hospital, :working_hours, :doctor_id)
  end

  def doctors_hospital
  	@hospital = Hospital.where("id=? and doctor_id=?",params[:id], current_doctor.id).first
  	if !@hospital.present?
  		flash[:alert] = "Record not found."
  		redirect_to doctors_path
  	end
  end

end
