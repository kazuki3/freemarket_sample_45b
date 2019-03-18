class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController

  def facebook
    callback_for(:facebook)
  end

  def google_oauth2
    callback_for(:google)
  end

  def callback_for(provider)
    oauth = request.env["omniauth.auth"]

    if User.where(email: oauth[:info][:email]).blank?
      @user = User.create_oauth(request.env["omniauth.auth"])
      if @user.persisted?
        bypass_sign_in(@user)
        redirect_to new_profile_path
        set_flash_message(:notice, :success, kind: "#{provider}".capitalize) if is_navigational_format?
      else
        session["devise.#{provider}_data"] = oauth.except("extra")
        redirect_to registration_select_path
      end
    else
      snscredential = SnsCredential.find_sns(oauth)
      @user = SnsCredential.check_sns(snscredential, oauth)
      bypass_sign_in(@user)
      redirect_to root_path, notice: 'ログインしました'
    end
  end

  def failure
    redirect_to root_path
  end

end
