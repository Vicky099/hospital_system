class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resources)
    if current_doctor.hospitals.present?
      flash[:notice] = "signed in successfully."
      dashboards_path
    else
      flash[:alert] = 'Please fill hospital information to complete your sign-up activity.'
      new_hospital_path
    end
  end

  def after_sign_out_path_for(resources)
    new_doctor_session_path
  end

  def authenticate_user!
    unless doctor_signed_in?
      flash[:danger] = "You must login first"
      redirect_to new_doctor_session_path
    end
  end

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :gender, :mobile_no, :residence_address, :city, :state, :education, :specialist, :skills, :thoughts])
  end
end
