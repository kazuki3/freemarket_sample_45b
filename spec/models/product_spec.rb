require 'rails_helper'

RSpec.describe Product, type: :model do

  describe Product do
    context 'product is valid' do
      it 'is valid' do
        user = create(:user)
        product = build(:product, seller_id: user.id)
        expect(product).to be_valid
      end
    end

    context 'product is invalid' do
      it 'is invalid without name' do
        user = create(:user)
        product = build(:product, seller_id: user.id, name: nil)
        product.valid?
        expect(product.errors[:name]).to include("を入力してください")
      end
      it 'is invalid without detail' do
        user = create(:user)
        product = build(:product, seller_id: user.id, detail: nil)
        product.valid?
        expect(product.errors[:detail]).to include("を入力してください")
      end
      it 'is invalid without category_id' do
        user = create(:user)
        product = build(:product, seller_id: user.id, category_id: nil)
        product.valid?
        expect(product.errors[:category_id]).to include("を入力してください")
      end
      it 'is invalid without condition' do
        user = create(:user)
        product = build(:product, seller_id: user.id, condition: nil)
        product.valid?
        expect(product.errors[:condition]).to include("を入力してください")
      end
      it 'is invalid without postage_id' do
        user = create(:user)
        product = build(:product, seller_id: user.id, postage_id: nil)
        product.valid?
        expect(product.errors[:postage_id]).to include("を入力してください")
      end
      it 'is invalid without shipping_method_id' do
        user = create(:user)
        product = build(:product, seller_id: user.id, shipping_method_id: nil)
        product.valid?
        expect(product.errors[:shipping_method_id]).to include("を入力してください")
      end
      it 'is invalid without prefecture_id' do
        user = create(:user)
        product = build(:product, seller_id: user.id, prefecture_id: nil)
        product.valid?
        expect(product.errors[:prefecture_id]).to include("を入力してください")
      end
      it 'is invalid without date' do
        user = create(:user)
        product = build(:product, seller_id: user.id, date: nil)
        product.valid?
        expect(product.errors[:date]).to include("を入力してください")
      end
      it 'is invalid without price' do
        user = create(:user)
        product = build(:product, seller_id: user.id, price: nil)
        product.valid?
        expect(product.errors[:price]).to include("を入力してください")
      end
      it 'is invalid without seller_id' do
        user = create(:user)
        product = build(:product, seller_id: nil)
        product.valid?
        expect(product.errors[:user]).to include()
      end
    end
  end

end
