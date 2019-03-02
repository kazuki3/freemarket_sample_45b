
class Users::SessionsController < Devise::SessionsController
  before_action :create_params, only: [:create]
  before_action :authenticate_user!, only: [:edit, :update]

  # GET /resource/sign_in
  def new
  end

  def create
  end


end
