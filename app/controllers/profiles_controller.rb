class ProfilesController < ApplicationController
  before_action :profile_params, only: [:create, :edit, :update]

  def index
  end


  def new
    @profile = Profile.new
  end


  def create
    @profile = Profile.new(profile_params)
      if @profile.save
        redirect_to new_payment_path
      else
        redirect_to new_profile_path
    end
  end


  def edit
  end


  def update
    @profile = Profile.update(profile_params)
      if @profile.update
        sign_in(current_user, bypass: true)
        redirect_to root_path
      else
        redirect_to edit_profile_path
    end
  end


  private
  def profile_params
    params.require(:profile).permit(:first_name, :last_name, :first_name_kana, :last_name_kana, :birthdate, :zip_code, :prefecture, :city, :address1, :address2, :phone_number, ).merge(user_id: current_user.id)
  end


end
