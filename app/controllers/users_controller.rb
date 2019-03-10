class UsersController < ApplicationController
  # before_action :authenticate_user!, only: [:signout]

  def index
  end


  def signout
  end

  def registration_select
  end

  devise :omniauthable, omniauth_providers: %i[facebook twitter google_oauth2]
  # omniauthのコールバック時に呼ばれるメソッド
  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
    end
  end
end