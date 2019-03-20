class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:signout]


  def signout
  end

  def show
    @user = User.find(params[:id])
  end

  def update
    user = User.find(params[:id])
    user.update(update_user_params) if user.id == current_user.id
    redirect_to edit_user_registration_path
  end


  def registration_select
    if user_signed_in?
    redirect_to root_path, notice: 'すでにログインしています。'
    end
  end

  private
  def update_user_params
    params.require(:user).permit(:nickname, :self_introduction)
  end

end
