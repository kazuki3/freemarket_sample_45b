Rails.application.routes.draw do

  root 'products#index'

  get   '/show', to: 'products#show'

  devise_for :users, :controllers => {
   :registrations => 'users/registrations',
   :sessions => 'users/sessions',
   :passwords => 'users/passwords'
  }

  resources :users

  # devise_scope :user do
  #   get 'my_page' => 'users/registrations#my_page'
  # end

end
