Rails.application.routes.draw do
  # Devise routes for users with custom sessions controller
  devise_for :users

  # Root path
  root to: "pages#home"

  # Health check route
  get "up", to: "rails/health#show", as: :rails_health_check

  # Nested user routes for bookings management and profile display
  resources :users do
    resources :bookings, only: [:index, :show, :edit, :update, :destroy]
  end

  # Stone routes with nested bookings
  resources :stones do
    resources :bookings, only: [:new, :create, :show]
  end
  resources :pages, only: [] do
    get 'profile/:id', to: 'pages#profile', as: :profile
  end
end
