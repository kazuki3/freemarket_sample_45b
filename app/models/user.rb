class User < ApplicationRecord

  devise :omniauthable,
         :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :validatable,
         omniauth_providers: %i(google_oauth2)

  validates :nickname, presence: true
  has_one :profile
  has_many :products
  has_one :users

  def self.find_for_google(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      user.nickname = auth.info.name
    end
  end
end
