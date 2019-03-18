class ProductsController < ApplicationController

  def index
  end


  def show
  end


  def new
    @postage = Postage.all
    @prefecture = Prefecture.all
    @category_root = Category.find(1).siblings
    @product = Product.new
    1.times { @product.images.build }
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to root_path
    else
      redirect_to new_product_path, flash: {miss: "必須項目をすべて選択してください"}
    end
  end

  def category
    if params[:parent]
      @child_categories = Category.where('ancestry = ?', "#{params[:parent]}")
    else
      @grandchild_categories = Category.where('ancestry LIKE ?', "%/#{params[:child]}")
    end
    respond_to do |format|
      format.html
      format.json
    end
  end

  def postage
    if params[:postage] == "送料込み(出品者負担)"
      @seller = ShippingMethod.seller
    else
      @buyer = ShippingMethod.buyer
    end
    respond_to do |format|
      format.html
      format.json
    end
  end

  def buy
    # 顧客カードデータ取得
    Payjp.api_key = 'sk_test_b77de856ed32a389b8f1d3c9'
    customer = Payment.find_by(user_id: current_user.id)
    customer_id = Payjp::Customer.retrieve(customer.customer_id)
    @customer = customer_id.cards.data[0]
    @product = Product.find(params[:id])
  end

  private
  def product_params
    params.require(:product).permit(:name, :detail, :category_id, :condition, :postage_id, :shipping_method_id, :prefecture_id, :date, :price, images_attributes: {image: []}).merge(seller_id: current_user.id);
  end

end
