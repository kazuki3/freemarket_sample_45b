class ProfilesController < ApplicationController
  before_action :profile_params, only: [:create, :edit, :update]

  def index

  end

  def new
    @profiles = Profile.new
  end

  def create
    @profiles = Profile.new(profile_params)
      if @profiles.save
        redirect_to new_payment_path
      else
        redirect_to new_profile_path
    end
  end

  private
  def profile_params
    params.require(:profile).permit(:first_name, :last_name, :first_name_kana, :last_name_kana, :birthdate, :zip_code, :prefecture, :city, :address1, :address2, :phone_number, ).merge(user_id: current_user.id)
  end

end
