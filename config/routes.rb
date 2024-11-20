Rails.application.routes.draw do
  devise_for :users
  # Devise routes for users with custom sessions controller

  # Root path

  root to: "pages#home"

  get '/dashboard', to: 'pages#dashboard'


  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Health check route
  get "up", to: "rails/health#show", as: :rails_health_check

  resources :users do
    resources :bookings, only: [:index, :show, :edit, :update, :destroy]
    member do
      get :dashboard
    end
  end


  # Stone routes with nested bookings
  resources :stones do
    resources :bookings, only: [:new, :create, :show, :edit, :update]
  end


  resources :pages, only: [] do
    get 'profile/:id', to: 'pages#profile', as: :profile
  end
end
