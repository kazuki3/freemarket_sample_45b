class ProductsController < ApplicationController

  def index
  end


  def show
    @product = Product.find(params[:id])
    @username = User.find(@product.seller_id).nickname
    @product_name = @product.name
    @detail = @product.detail
    @price = @product.price
    @condition = @product.condition_i18n
    @date = @product.date_i18n
    @prefecture = Prefecture.find(@product.prefecture.id).name
    @postage = Postage.find(@product.postage.id).name
    @shipping_method = ShippingMethod.find(@product.shipping_method.id).name
    @status = @product.status
    @image = @product.images
    binding.pry
    if @product.postage.id == 1
      @shipping_fee = "送料込み"
    else
      @shipping_fee = "着払い"
    end

    @category = Category.find(@product.category_id)
    if @category.depth == 2
      @parent_category = @category.root.name
      @child_category = @category.parent.name
      @grandchild_category = @category.name
    elsif @category.depth == 1
      @parent_category = @category.root.name
      @child_category = @category.name
      @grandchild_category = "none"
    end
  end


  def new
    @postage = Postage.all
    @prefecture = Prefecture.all
    @category_root = Category.find(1).siblings
    @product = Product.new
    4.times { @product.images.build }
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

  private
  def product_params
    params.require(:product).permit(:name, :detail, :category_id, :condition, :postage_id, :shipping_method_id, :prefecture_id, :date, :price, images_attributes: :image_path).merge(seller_id: current_user.id);
  end

end
