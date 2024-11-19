Rails.application.routes.draw do
  devise_for :users
  # Devise routes for users with custom sessions controller
  # devise_for :users, controllers: {
  #   sessions: 'users/sessions'
  # }

  # Root path

  root to: "pages#home"

  # get '/dashboard', to: 'pages#dashboard'


  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Health check route
  get "up", to: "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"

  # Nested user routes for bookings management
  resources :users do
    resources :bookings, only: [:index, :show, :edit, :update, :destroy]
    member do
      get :dashboard
    end
  end


  # Stone routes with nested bookings
  resources :stones do
    resources :bookings, only: [:new, :create, :show]
  end
end
