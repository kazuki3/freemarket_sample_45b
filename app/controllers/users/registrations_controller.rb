class Users::RegistrationsController < Devise::RegistrationsController
  before_action :create_params, only: [:create]
  before_action :authenticate_user!, only: [:edit, :update]


  def index
    @user = User.new
  end


  def new
    @user = User.new
  end


  def create
    @user = User.new(create_params)
      if @user.save
        sign_in(@user, bypass: true)
        redirect_to new_profile_path
      else
        redirect_to new_user_registration_path
    end
  end


  def edit
    sign_in(current_user, bypass: true)
  end

  def update
    @user = Profile.update(create_params)
      if @user.update
        sign_in(@user, bypass: true)
        redirect_to root_path
      else
        redirect_to user_registration_path
      end
  end


  private
  def create_params
    params.require(:user).permit(:nickname, :email, :password, :password_confirmation, :self_introduction)
  end

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :self_introduction])
  end

end
