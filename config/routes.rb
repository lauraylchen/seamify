Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  # View all Seamstresses
  get '/users', to: 'users#index'

  # Create a new user profile
  # get '/new', to: 'users#new'
  # post '/user', to: 'users#create'
end
