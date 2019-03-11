class User < ApplicationRecord

  devise  :omniauthable,
          :database_authenticatable,
          :registerable,
          :recoverable,
          :rememberable,
          :validatable,
          omniauth_providers: %i[facebook google_oauth2]


  has_one :profile
  has_many :products
  has_one :users
  has_many :sns_credentials

  def self.create_oauth(auth)
  user = User.create(
    nickname: auth.info.name,
    email:    auth.info.email,
    password: Devise.friendly_token[0, 20]
    )
  SnsCredential.create(
    uid: auth.uid,
    provider: auth.provider,
    user_id: user.id
    )
  return user
  end

  def self.find_oauth(auth)
    uid = auth.uid
    provider = auth.provider
    snscredential = SnsCredential.where(uid: uid, provider: provider).first
    if snscredential.present?
      user = User.where(id: snscredential.user_id).first
    else
      user = User.where(email: auth.info.email).first
      SnsCredential.create(
        uid: uid,
        provider: provider,
        user_id: user.id
        )
    end
  end
end
