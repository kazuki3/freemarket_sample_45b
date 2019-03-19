class LikesController < ApplicationController
  before_action :authenticate_user!, only: [:create, :destroy]

  before_action :set_variables

  def create
    like = current_user.likes.new(product_id: @product.id)
    if like.save

    else
      flash[:miss] = "いいねに失敗しました。"
    end
  end

  def destroy
    like = current_user.likes.find_by(product_id: @product.id)
    if like.destroy

    else
      flash[:miss] = "いいね取り消しに失敗しました。"
    end
  end

  private

  def set_variables
    @product = Product.find(params[:product_id])
    @id_name = "#like-link-#{@product.id}"
  end
end
