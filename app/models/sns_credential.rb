class SnsCredential < ApplicationRecord
  belongs_to :user

  validates :uid, presence: true, unique: true
  validates :provider, presence: true, unique: true
  validates :user_id, presence: true, unique: true


  def self.find_sns(auth)
    uid = auth.uid
    provider = auth.provider
    snscredential = SnsCredential.where(uid: uid, provider: provider).first
    return snscredential
  end

  def self.create_sns(auth)
    user = User.where(email: auth.info.email).first
    SnsCredential.create(
      uid: auth.uid,
      provider: auth.provider,
      user_id: user.id
      )
    return user
  end

  def self.check_sns(snscredential, oauth)
    if snscredential.present?
      @user = User.where(id: snscredential.user_id).first
    else
      @user = SnsCredential.create_sns(oauth)
    end
    return @user
  end
end
