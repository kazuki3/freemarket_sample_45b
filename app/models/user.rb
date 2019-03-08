class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :trackable,
         :omniauthable,
         :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :validatable,
         omniauth_providers: %i(google_oauth2)


  def self.find_for_google(auth)
    user = User.where(uid: auth.uid, provider: auth.provider).first
    unless user
      user = User.create(uid:       auth.info.uid,
                         email:    auth.info.email,
                         nickname: auth.info.name,
                         password: Devise.friendly_token[0, 20],
                         provider: auth.provider,
                         token:    auth.credentials.token,
    )
    end
    user
  end

  has_one :profile
  has_one :users
  validates :nickname, presence: true
  validates :email, presence: true
  validates :password, presence: true
  validates :password_confirmation, presence: true

end

  # omniauthのコールバック時に呼ばれるメソッド
  # def self.from_omniauth(auth)
  #   where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
  #     uid = auth.uid
  #     nickname = auth.info.name
  #     email = auth.info.email
  #     password = Devise.friendly_token[0,20]
  #     provider = auth.provider
  #     token = auth.credentials.token
  #   end
  # end

  # def self.from_omniauth(auth)
  #   uid = auth.id
  #   provider = auth.provider
  #   snscredential = SnsCredential.where(uid: uid, provider: provider).first
  #   if snscredential.present?
  #     user = User.where(id: snscredential.user_id).first
  #   else
  #     user = User.where(email: auth.info.email).first
  #     if user.present?
  #       SnsCredential.create(
  #         uid: uid,
  #         provider: provider,
  #         user_id: user.id
  #         )
  #     else
  #       user = User.create(
  #         nickname: auth.info.name,
  #         email:    auth.info.email,
  #         # password: Devise.friendly_token[0, 20],
  #         )
  #       SnsCredential.create(
  #         uid: uid,
  #         provider: provider,
  #         user_id: user.id
  #         )
  #     end
  #   end
  #   return user
  # end


  # attr_accessor :nickname, :password, :uid, :providere
  # # omniauthのコールバック時に呼ばれるメソッド
  # protected
