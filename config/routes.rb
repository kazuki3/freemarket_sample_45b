Rails.application.routes.draw do

devise_for :users, :controllers => {
 :omniauth_callbacks => 'users/omniauth_callbacks',
 :registrations => 'users/registrations',
 :sessions => 'users/sessions'
}

  root 'products#index'

  resources :products do
    collection do
      get 'buy'
      get 'category'
      get 'postage'
    end
  end

  post   '/like/:product_id' => 'likes#like',   as: 'like'
  delete '/like/:product_id' => 'likes#unlike', as: 'unlike'

  resources :users
  resources :profiles
  resources :payments
  get   'user/signout', to: 'users#signout'
  get   'select', to: 'users#registration_select', as: 'registration_select'

end
