class ProductsController < ApplicationController

  def index
  end


  def show
  end

  def new
<<<<<<< HEAD
    @category_root = Category.find(1).siblings
    @product = Product.new
  end

  def create
    @product = Product.new()
    if @product.save
      redirect_to 'root_path'
    else
      redirect_to new_product_paht
    end
  end

=======
    @product = Product.new
  end

>>>>>>> master
end
