
class Users::SessionsController < Devise::SessionsController

  def new
  super
    if current_user
    flash[:notice] = "すでにログインしています。"
    redirect_to root_path
    end
  end
end
