Rails.application.routes.draw do
  devise_for :users
  get "home/index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/*
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  # routes for users
  resources :users
  # post '/auth/login', to: 'authentication#login'
   resources :reviews

  resources :bookings, only: [:index, :new , :create, :show]

  resources :turves


  # API

  namespace :api do
    namespace :v1 do
      resources :users, only: [:index, :show, :create]
      post '/auth/login', to: 'authentication#login'

      resources :turves do
        resources :time_slots
      end
      resources :reviews

     
    end 
  end


  # Defines the root path route ("/")
  # root "posts#index"
  root "users#index"
end
