
class Users::SessionsController < Devise::SessionsController


  def new
  super
  flash[:notice] = "既にログイン済みです。" unless user_signed_in?
  redirect_to root_path
  end



  def create
    if verify_recaptcha
      flash[:notice] = "ログインしました"
      super
    else
      self.resource = resource_class.new
      respond_with_navigational(resource) { render :new }
    end
  end

end
