class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def facebook
    callback_for(:facebook)
  end

  def google_oauth2
    callback_for(:google)
  end

  def callback_for(provider)
    oauth_email = request.env["omniauth.auth"][:info][:email]

    if User.where(email: oauth_email).blank?
      @user = User.create_oauth(request.env["omniauth.auth"])
      if @user.persisted?
        bypass_sign_in(@user)
        redirect_to new_profile_path
        set_flash_message(:notice, :success, kind: "#{provider}".capitalize) if is_navigational_format?
      else
        session["devise.#{provider}_data"] = request.env["omniauth.auth"].except("extra")
        redirect_to index2_path
      end
    else
      snscredential = SnsCredential.find_sns(request.env["omniauth.auth"])
      if snscredential.present?
        @user = User.where(id: snscredential.user_id).first
      else
        @user = SnsCredential.create_sns(request.env["omniauth.auth"])
      end
      sign_in(@user)
      redirect_to root_path
    end
  end

  def failure
    redirect_to root_path
  end

end
