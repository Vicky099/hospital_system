class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def after_sign_in_path_for(resources)
    dashboards_path
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
end
