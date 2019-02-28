Rails.application.routes.draw do

  root 'products#index'

  get   '/show', to: 'products#show'

  devise_for :users, :controllers => {
   :registrations => 'users/registrations',
   :sessions => 'users/sessions',
   :passwords => 'users/passwords'
  }

  resources :profiles

end
