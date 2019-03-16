Rails.application.routes.draw do

devise_for :users, :controllers => {
 :omniauth_callbacks => 'users/omniauth_callbacks',
 :registrations => 'users/registrations',
 :sessions => 'users/sessions'
}

  root 'products#index'
    resources :products do
<<<<<<< HEAD
      collection do
        get 'buy'
=======
    collection do
    get 'buy'
    get 'category'
    get 'postage'
>>>>>>> kazuki3/master
    end
  end

  resources :users
  resources :profiles
  resources :payments
  get   'user/signout', to: 'users#signout'
<<<<<<< HEAD
  get   'index', to: 'users#index'
  get   'index2', to: 'users#registration_select'

  # devise_scope :user do
  #   post '/users', to: 'users/registrations#create'
  # end
=======
  get   'select', to: 'users#registration_select', as: 'registration_select'
>>>>>>> kazuki3/master

end
