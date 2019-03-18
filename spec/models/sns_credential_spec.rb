require 'rails_helper'

describe :sns_credential, class: SnsCredential do

  describe '#create' do

# 登録可能（全項目あり）
    it "is valid with a uid, provider, user_id" do
      user = FactoryBot.build(:user)
      expect(user).to be_valid
    end


# 値が空の場合登録不可
    it "is invalid without uid" do
      user = build(:sns_credential, uid: "")
      user.valid?
      expect(user.errors[:uid]).to include("を入力してください")
    end

    it "is invalid without provider" do
      user = build(:sns_credential, provider: "")
      user.valid?
      expect(user.errors[:provider]).to include("を入力してください")
    end


#重複により登録不可
    it "is invalid with not unique uid" do
      sns_credential = create(:sns_credential)
      sns_credential2 = build(:sns_credential)
      sns_credential2.valid?
      expect(sns_credential2.errors[:uid]).to include("はすでに存在します")
    end


  end
end
