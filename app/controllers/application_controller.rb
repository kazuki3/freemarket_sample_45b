class ApplicationController < ActionController::Base
  before_action :basic_auth, if: :production?
<<<<<<< HEAD

  before_action :configure_permitted_parameters, if: :devise_controller?



=======

  before_action :configure_permitted_parameters, if: :devise_controller?



>>>>>>> master
private
  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV["BASIC_AUTH_USER"] && password == ENV["BASIC_AUTH_PASSWORD"]
    end
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :self_introduction])
  end
<<<<<<< HEAD
=======


  protect_from_forgery with: :exception
>>>>>>> master


  protect_from_forgery with: :exception
  private
  def production?
    Rails.env.production?
  end


  def after_sign_in_path_for(resource)
    root_path
<<<<<<< HEAD
=======
  end

  def after_sign_out_path_for(resource)
    index_path
>>>>>>> master
  end

  def after_sign_out_path_for(resource)
    index_path
  end

  def after_sign_out_path_for(resource)
    new_user_session_path
  end


end
