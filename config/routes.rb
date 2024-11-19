Rails.application.routes.draw do
  devise_for :users
  # Devise routes for users with custom sessions controller
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }

  # Root path

  root to: "pages#home"

  # Health check route
  get "up", to: "rails/health#show", as: :rails_health_check

  # Nested user routes for bookings management
  resources :users do
    resources :bookings, only: [:index, :show, :edit, :update, :destroy]
  end

  # Stone routes with nested bookings
  resources :stones do
    resources :bookings, only: [:new, :create, :show]
  end
end
  