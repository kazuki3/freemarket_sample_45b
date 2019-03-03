Rails.application.routes.draw do

  root 'products#index'
  resources :products
  resources :profiles

  devise_for :users, :controllers => {
   :registrations => 'users/registrations',:sessions => 'users/sessions',:passwords => 'users/passwords'
  }

  devise_scope :user do
    get   'users/index', to: 'users/registrations#index'
    get   'users/signout', to: 'users/registrations#signout'
    post '/users' => 'users/registrations#create'
  end

  resources :payments
  get   '/show', to: 'products#show'

  # resources :profiles do
  #   collection do
  #     get 'signout'
  #   end
  # end

end

  # pay.jp用の記述（作成の時のために置いておく）メモ：平良
  # resources :payments do only: [:index, :new, :update, :create] do
  #   collection do
  #     post 'pay'
  #   end
  # end
