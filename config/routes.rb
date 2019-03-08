Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'products#index'

  get   '/show', to: 'products#show'

devise_for :users, :controllers => {
 :registrations => 'users/registrations',
 :sessions => 'users/sessions'
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
