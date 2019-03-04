
class Users::SessionsController < Devise::SessionsController
  # before_action :authenticate_user!

  def new
    @user = User.new
  end

  def create
    @user = User.new
      if @user.save
        sign_in(@user, bypass: true)
        redirect_to root_path
      else
        redirect_to new_user_session_path
    end
  end

end
