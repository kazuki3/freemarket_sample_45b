# frozen_string_literal: true

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
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end
end
