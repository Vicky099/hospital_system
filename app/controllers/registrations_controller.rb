class RegistrationsController < Devise::RegistrationsController

  def index
  end

  def new
    super
  end

  def create

  end

  def update
    current_doctor.build_picture(photo: params[:doctor][:photo]) if params[:doctor][:photo].present?
    if current_doctor.update_attributes(doctor_params)
      flash[:success] = 'Profile details updated successfully!!'
      redirect_to doctors_path
    else
      flash[:danger] = "Something went wrong!!"
      render action: :new
    end
  end

  private
  def doctor_params
    params.require(:doctor).permit(:first_name, :last_name, :gender, :mobile_no, :residence_address, :city, :state, :education, :specialist, :email, :skills, :thoughts)
  end
end
