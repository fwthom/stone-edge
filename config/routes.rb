Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }

  # Root path
  root to: "pages#home"

  # Custom routes
  get '/dashboard', to: 'pages#dashboard'
  patch '/bookings/:id/accept', to: 'bookings#accept', as: 'accept'
  patch '/bookings/:id/decline', to: 'bookings#decline', as: 'decline'

  get 'pages/profile/:id', to: 'pages#profile', as: 'profile_page'

  # Stone routes with nested bookings
  resources :stones do
    resources :bookings, only: [:new, :create, :show, :edit, :update]
  end

  resources :bookings

  # Health check route
  get "up", to: "rails/health#show", as: :rails_health_check
end
