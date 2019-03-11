class PaymentsController < ApplicationController
  before_action :authenticate_user!
  before_action :payment_params, only: [:create, :update]

  def new
    @payment = Payment.new
  end


  def create
    @payment = Payment.new(payment_params)
      if @payment.save
        redirect_to root_path
      else
        redirect_to new_payment_path
    end
  end


  private
  def payment_params
    params.require(:payment).permit(:card_number, :expiration_date, :security_code, ).merge(user_id: current_user.id)
  end

end
