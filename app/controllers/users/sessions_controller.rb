class Users::SessionsController < Devise::SessionsController

  def new
    @user = User.new
  end

  def create
    @user = User.new(create_params)
      if @user
        redirect_to products_path
      else
        redirect_to new_user_session_path
      end
  end



  def create
    user = User.find_by(email: params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      # ユーザーをサインインさせ、ユーザーページ (show) にリダイレクトする。
    else
      # エラーメッセージを表示し、サインインフォームを再描画する。
    end
  end



  private
  def create_params
    params.permit(:email, :password)
  end

end
