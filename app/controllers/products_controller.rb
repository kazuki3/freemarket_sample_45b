class ProductsController < ApplicationController

  def index
  end


  def show
    @product = Product.find(params[:id])
    @user = User.find(@product.seller_id)

    @category = @product.category
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

  def destroy
    product = Product.find(params[:id])
    product.destroy if product.seller_id == current_user.id
    redirect_to root_path, notice: '商品を削除しました'
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
    params.require(:product).permit(:name, :detail, :category_id, :condition, :postage_id, :shipping_method_id, :prefecture_id, :date, :price, images_attributes: [:image_path]).merge(seller_id: current_user.id);
  end

end
