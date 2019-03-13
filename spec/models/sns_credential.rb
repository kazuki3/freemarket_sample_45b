require 'rails_helper'

describe Sns_credential do
  describe '#callback_for' do

    it "is valid with a uid, provider, user_id" do
      sns_credential = build(:sns_credential)
      expect(sns_credential).to be_valid
    end

    it "is invalid without a uid" do
      sns_credential = build(:sns_credential, uid: nil)
      sns_credential.valid?
      expect(sns_credential.errors[:uid][0]).to include("を入力してください")
    end

    it "is invalid without a provider" do
      sns_credential = build(:sns_credential, provider: nil)
      sns_credential.valid?
      expect(sns_credential.errors[:provider][0]).to include("を入力してください")
    end

    it "is invalid without a user_id" do
      sns_credential = build(:sns_credential, user_id: nil)
      sns_credential.valid?
      expect(sns_credential.errors[:user_id][0]).to include("を入力してください")
    end

    it "is invalid with a duplicate uid" do
      sns_credential = build(:sns_credential, uid: user.uid)
      sns_credential.valid?
      expect(sns_credential.errors[:uid][0]).to include("はすでに存在します")
    end

    it "is invalid with a duplicate provider" do
      sns_credential = build(:sns_credential, provider: user.provider)
      sns_credential.valid?
      expect(sns_credential.errors[:provider][0]).to include("はすでに存在します")
    end

    it "is invalid with a duplicate user_id" do
      sns_credential = build(:sns_credential, user_id: user.user_id)
      sns_credential.valid?
      expect(sns_credential.errors[:user_id][0]).to include("はすでに存在します")
    end

end
