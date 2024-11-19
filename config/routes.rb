Rails.application.routes.draw do
  get 'stones/index'
  get 'stones/show'
  get 'stones/new'
  get 'stones/create'
  get 'stones/update'
  get 'stones/edit'
  get 'stones/destroy'
  devise_for :users
  root to: "pages#home"
  get 'dashboard', to: 'pages#dashboard'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"

  resources :users do
    resources :bookings, only: [:index, :show, :edit, :update, :destroy]
  end


  resources :stones do
    resources :bookings, only: [:new, :create, :show]
  end
end
