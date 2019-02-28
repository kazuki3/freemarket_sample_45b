class ProfilesController < ApplicationController
  before_action :profile_params, only: [:create, :edit, :update]

  def index
  end


  def new
    @profile = Profile.new
  end


  def create
    @profile = Profile.create(profile_params)
      if @profile.save
        # sign_in(@profile, bypass: true)
        redirect_to new_payment_path
      else
        redirect_to new_profile_path
    end
  end


  def edit
    sign_in(current_user, bypass: true)
    @profile = Profile.update(profile_params)
  end


  def update
    sign_in(current_user, bypass: true)
    @profile = Profile.update(profile_params)
  end


  private
  def profile_params
    params.require(:profile).permit(:first_name, :last_name, :first_name_kana, :last_name_kana, :birthdate, :zip_code, :prefecture, :city, :address1, :address2, :phone_number, ).merge(user_id: current_user.id)
  end


end
