class Users::RegistrationsController < Devise::RegistrationsController
  before_action :create_params, only: [:create, :update]
  before_action :authenticate_user!, only: [:edit, :update]


  def index
    @user = User.new
  end


  def new
    @user = User.new
  end


  def create
    @user = User.new(create_params)
      if @user.save
        sign_in(@user, bypass: true)
        redirect_to new_profile_path
      else
        redirect_to new_user_registration_path
    end
  end

# プロフィール更新ページへ移行
  def edit

  end

# プロフィール更新
  def update
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:session][:password])
    redirect_to root_path
    else
    render 'new'
    end
  end

  def signout
  end


  private
  def create_params
    params.require(:user).permit(:nickname, :email, :password, :password_confirmation, :self_introduction)
  end


  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :self_introduction])
  end

end
