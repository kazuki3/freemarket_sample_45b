# frozen_string_literal: true
class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  # devise :omniauthable, omniauth_providers: [:google]
  # devise :omniauthable, omniauth_providers: [:facebook]
  # You should configure your model like this:
  # devise :omniauthable, omniauth_providers: %i[facebook twitter google_oauth2]
  # You should also create an action method in this controller like this:

 # # callback for facebook
 #  def facebook
 #    callback_for(:facebook)
 #  end

 #  # callback for twitter
 #  def twitter
 #    callback_for(:twitter)
 #  end

  # callback for google
  # def google
  #   callback_for(:google)
  # end


  def google_oauth2
    callback_for
  end

  # def google
  #   callback_for(:google)
  # end

# common callback method

  def callback_for
    @user = User.find_for_google(request.env['omniauth.auth'])
    if @user.persisted?
      flash[:notice] = I18n.t 'devise.omniauth_callbacks.success', kind: 'Google'
      sign_in_and_redirect @user, event: :authentication
    else
      # session['devise.google_data'] = request.env['omniauth.auth']
      bingding.pry
      redirect_to index2_path
    end
  end

  # common callback method
  # def callback_for(provider)
  #   provider = provider.to_s

  #   @user = User.find_for_oauth(request.env['omniauth.auth'])

  #   if @user.persisted?
  #     flash[:notice] = I18n.t('devise.omniauth_callbacks.success', kind: provider.capitalize)
  #     sign_in_and_redirect @user, event: :authentication
  #   else
  #     session["devise.#{provider}_data"] = request.env['omniauth.auth']
  #     redirect_to new_user_registration_path
  #   end
  # end

  # def failure
  #   redirect_to root_path
  # end

end


  # def twitter
  # end

  # More info at:
  # https://github.com/plataformatec/devise#omniauth

  # GET|POST /resource/auth/twitter
  # def passthru
  #   super
  # end

  # GET|POST /users/auth/twitter/callback
  # def failure
  #   super
  # end


  # protected

  # The path used when OmniAuth fails
  # def after_omniauth_failure_path_for(scope)
  #   super(scope)
  # end
