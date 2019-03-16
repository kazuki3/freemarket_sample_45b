
class Users::RegistrationsController < Devise::RegistrationsController
  before_action :authenticate_user!, only: [:new, :after_sign_up_path_for]

  def new
    super
  end



  def after_sign_up_path_for(resource)
    new_profile_path
  end


end
