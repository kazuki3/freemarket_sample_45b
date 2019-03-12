class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:signout]


  def signout
  end

  def registration_select
  end

end
