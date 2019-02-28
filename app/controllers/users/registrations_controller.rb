class Users::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_permitted_parameters, if: :users_registrations_controller?
  before_action :create_params, only: [:create]
  # before_action :profile_params, only: [:edit, :update]
  before_action :authenticate_user!, only: [:edit, :update]
  # before_action :configure_account_update_params, only: [:update]


  def new
    @user = User.new
  end


  def create
    @user = User.create(create_params)
      if @user.save
          sign_in(@user, bypass: true)
          redirect_to edit_user_registration_path
      else
        redirect_to new_user_registration_path
    end
  end


  def edit
    sign_in(current_user, bypass: true)
    @profile = Profile.new
  end

  def update
    @profile = Profile.update(profile_params)
  end

  # def after_sign_up_path_for(resource)
  #   super
  #   redirect_to :action => 'edit'
  # end


  private
  def create_params
    params.require(:user).permit(:nickname, :email, :password, :password_confirmation)
  end


  private
  def profile_params
    params.require(:profile).permit(:first_name, :last_name, :first_name_kana, :last_name_kana, :birthdate, :zip_code, :prefecture, :city, :address1, :address2, :phone_number, ).merge(user_id: current_user.id)
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname])
  end

end



  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  # end


  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   仮登録完了後のページ
  # end
