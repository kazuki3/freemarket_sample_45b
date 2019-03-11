class SnsCredential < ApplicationRecord
  belongs_to :user

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
end
