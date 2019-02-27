class UsersController < ApplicationController
  before_action :authenticate_user!, only: :new

  def index

  end

  def show

  end


  def new

  end


  def create

  end


  def edit

  end


  def update

  end


  def destroy

  end

  private
  def create_params
    params.require(:profile).permit(first_name:string last_name:string first_name_kana:integer last_name_kana:integer birthdate:date zip_code:integer prefecture:string city:string ddress1:string ddress2:string phone_number:string user:references).merge(user_id: current_user.id)
  end

end


  def new
    @product = Product.find(params[:product_id])
    @review = Review.new
  end

  def create
    Review.create(create_params)

    redirect_to controller: :products, action: :index
  end

  private
  def create_params
    params.require(:profile).permit(:rate, :review).merge(product_id: params[:product_id], user_id: current_user.id)
  end
end
