Rails.application.routes.draw do

devise_for :users, :controllers => {
 :omniauth_callbacks => 'users/omniauth_callbacks',
 :registrations => 'users/registrations',
 :sessions => 'users/sessions'
}

  root 'products#index'
    resources :products do
      collection do
        get 'category'
        get 'postage'
        get 'search'
      end
      member do
        get 'buy'
      end
  end

  resources :users
  resources :profiles
  resources :payments
  resources :trades, only: :update
  get   'user/signout', to: 'users#signout'
  get   'select', to: 'users#registration_select', as: 'registration_select'

end
