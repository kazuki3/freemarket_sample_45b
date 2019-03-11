Rails.application.routes.draw do

devise_for :users, :controllers => {
 :registrations => 'users/registrations',
 :sessions => 'users/sessions',
 :omniauth_callbacks => "users/omniauth_callbacks"
}

  root 'products#index'
    resources :products do
    collection do
    get 'buy'
    end
  end

  resources :users
  resources :profiles
  resources :payments
  get   'user/signout', to: 'users#signout'
  get   'index', to: 'users#index'
  get   'index2', to: 'users#registration_select'


  # devise_scope :user do
  #   post '/users', to: 'users/registrations#create'
  # end


end
