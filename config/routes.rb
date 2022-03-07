Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  # Search Form
  get '/search', to: 'users#search', as: 'search'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  # View all Seamstresses
  resources :users, only: %i[index show] do
    resources :orders, only: %i[create]
  end

  resources :orders, only: %i[show update]

  # A user can view all their current orders
  get '/my-orders', to: 'orders#index', as: 'my_orders'

  # Chatroom
  resources :chatrooms, only: :show

  # Create a new user profile
  # get '/new', to: 'users#new'
  # post '/user', to: 'users#create'
end
