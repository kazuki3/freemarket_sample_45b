class PaymentsController < ApplicationController
  before_action :authenticate_user!

  def new
    @payment = Payment.new
  end

  def create
    Set_api_for_payjp
    customer = Payjp::Customer.create(card: params[:payjpToken])
    @payment = Payment.new(user_id: current_user.id, customer_id: customer.id, card_token: params[:payjpToken])
    if @payment.save
      redirect_to root_path
    else
      redirect_to new_payment_path
    end
  end

end
