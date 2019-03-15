class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:signout]

  def index
  end


  def signout
  end

  def registration_select
  end


end
