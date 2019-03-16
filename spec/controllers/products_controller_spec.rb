require 'rails_helper'

describe ProductsController, type: :controller do
  let(:user) {create(:user)}
  let(:product) {create(:product, seller_id: user.id)}

  describe 'GET #show' do
    it "has a 200 status code" do
      get :show, params: { id: product.id }
      expect(response).to render_template :show
      expect(response).to have_http_status(:ok)
    end
  end

end
