class PaymentsController < ApplicationController

  before_action :payment_params, only: [:create, :update]
  before_action :authenticate_user!



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

<<<<<<< HEAD
# 下記は今後の使用予定のため、コメントアウトにて置きます。
  # def pay
  #     Payjp.api_key = '秘密キー'
  #     charge = Payjp::Charge.create(
  #     :amount => 3500,
  #     :card => params['payjp-token'],
  #     :currency => 'jpy',
  # )
  # end

=======
>>>>>>> a22919d19b4402abcc0dccd0d82841026e6e38d4
end
