class TradesController < ApplicationController
  before_action :Set_api_for_payjp

  def update
    customer = Payment.find_by(user_id: current_user.id)
    Product.find(params[:id]).update( status: '1' )
    @trade = Trade.new(user_id: current_user.id, product_id: params[:id])
    @trade.save

    Payjp::Charge.create(
    amount: params[:product][:price],
    customer: customer.customer_id,
    currency: 'jpy'
    )
    redirect_to root_path
  end

end
