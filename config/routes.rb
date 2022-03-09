Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  # View all Seamstresses
  resources :users, only: %i[index show] do
    resources :orders, only: %i[create]
  end

  resources :orders, only: %i[show update]

  # Conversation
  resources :conversations, only: %i[index show] do
    resources :messages, only: :create
  end
  
   # Create a review for the seamstress
  resources :orders, only: [] do
    resources :reviews, only: [:new, :create]
  end
  
  # Custom routes
  # Contact a seamstress for chat
  get '/contact/:seamstress_id', to: 'conversations#contact', as: 'contact'

  # Search Form
  get '/search', to: 'users#search', as: 'search'

  #A user can view all their current orders
  get '/my-orders', to: 'orders#index', as: 'my_orders'

  # A user can view their profile
  get '/my-profile', to: 'users#profile', as: 'my_profile'

end
