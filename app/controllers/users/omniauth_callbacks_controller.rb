# frozen_string_literal: true
class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController


  def google_oauth2
    callback_for
  end


  def callback_for
    @user = User.find_for_google(request.env['omniauth.auth'])
    if @user.persisted?
      flash[:notice] = I18n.t 'devise.omniauth_callbacks.success', kind: 'Google'
      bypass_sign_in(@user)
      redirect_to new_profile_path
    else
      session["devise.#{provider}_data"] = request.env["omniauth.auth"].except("extra")
      redirect_to index2_path
    end
  end

end
