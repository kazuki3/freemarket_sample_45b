Rails.application.routes.draw do

  root 'products#index'
    resources :products do
    collection do
    get 'buy'
    end
  end

  devise_for :users


  devise_scope :user do
    post '/users', to: 'users/registrations#create'
  end

  resources :users
  resources :profiles
  resources :payments
  get   'user/signout', to: 'users#signout'
  get   'index', to: 'users#index'
  get   'index2', to: 'users#registration_select'

end
