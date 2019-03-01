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
    @user = User.create(create_params)
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
      if @user.save
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



  # def destroy
  #   super
  # end


  # def cancel
  #   super
  # end


  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end


  # def after_sign_up_path_for(resource)
  #   super
  # end


  # The path used after sign up.


  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   仮登録完了後のページ
  # end
