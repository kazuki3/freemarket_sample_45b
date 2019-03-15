class ProductsController < ApplicationController

  def index
    @products = Product.all
    @images = Image.all
  end


  def show
  end


  def new
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

end
