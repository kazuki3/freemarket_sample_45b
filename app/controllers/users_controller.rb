class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:signout]


  def signout
  end


  def registration_select
    if user_signed_in?
    redirect_to root_path, notice: 'すでにログイン済みです。'
    end
  end

end
