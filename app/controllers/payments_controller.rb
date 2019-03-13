class PaymentsController < ApplicationController
  before_action :authenticate_user!
  before_action :payment_params, only: [:create]

  def new
    @payment = Payment.new
  end


  def create
    @payment = Payment.new(payment_params)
      if @payment.save
        redirect_to root_path, notice: '登録は全て完了しました'
      else
        flash.now[:alert] = '未入力項目があります'
        render :new
    end
  end


  private
  def payment_params
    params.require(:payment).permit(:card_number, :expiration_date, :security_code, ).merge(user_id: current_user.id)
  end

end
