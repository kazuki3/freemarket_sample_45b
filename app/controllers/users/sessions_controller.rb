
class Users::SessionsController < Devise::SessionsController

  def new
  super
    if current_user
    flash[:notice] = "すでにログイン済みです。"
    redirect_to root_path
    end
  end
end
