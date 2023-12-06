Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get '/signin', to: 'sessions#new'
  post '/signin', to: 'sessions#create'
  delete '/signout', to: 'sessions#destroy'
  resources :rooms
  resources :users
  root 'rooms#index'
  resources :rooms do
    resources :messages
  end

  get '/send_sms', to: 'sms#send_sms', as: 'send_sms'


end
