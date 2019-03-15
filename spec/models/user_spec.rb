require 'rails_helper'

describe User, class: User do

  describe '#create' do
# 登録可能（全項目あり）
    it "is valid with a nickname, email, password, password_confirmation" do
      user = FactoryBot.build(:user)
      expect(user).to be_valid
    end

# 入力項目が空の場合登録不可
    it "is invalid without a nickname" do
      user = build(:user, nickname: "")
      user.valid?
      expect(user.errors[:nickname]).to include("を入力してください")
    end

    it "is invalid without a email" do
      user = build(:user, email: "")
      user.valid?
      expect(user.errors[:email]).to include("を入力してください")
    end

    it "is invalid without a password" do
      user = build(:user, password: "")
      user.valid?
      expect(user.errors[:password]).to include("を入力してください")
    end

    it "is invalid without a password_confirmation" do
      user = build(:user, password_confirmation: "")
      user.valid?
      expect(user.errors[:password_confirmation]).to include("とPasswordの入力が一致しません")
    end


# 境界値 パスワード文字数5桁以下入力不可
    it "is invalid with a password that has less than 5 characters " do
      user = build(:user, password: "0")
      user.valid?
      expect(user.errors[:password]).to include("は6文字以上で入力してください")
    end

# 確認用パスワード不一致
    it "is invalid without a password_confirmation although with a password" do
      user = build(:user, password_confirmation: "111111")
      user.valid?
      expect(user.errors[:password_confirmation]).to include("とPasswordの入力が一致しません")
    end

#重複により登録不可
    it "is invalid with a duplicate nickname address" do
      user = create(:user)
      another_user = build(:user)
      another_user.valid?
      expect(another_user.errors[:nickname]).to include("はすでに存在します")
    end

    it "is invalid with a duplicate email address" do
      user = create(:user)
      another_user = build(:user)
      another_user.valid?
      expect(another_user.errors[:email]).to include("はすでに存在します")
    end

  end
end
