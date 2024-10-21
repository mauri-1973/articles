Rails.application.routes.draw do
 

  root "post#index"
  
  resources :posts

  resources :posts do
    member do
      post 'like'
      post 'dislike'
    end
    resources :commentnews, only: :create
  end

  resources :articles

  devise_for :users
  
  post '/new_user_reaction', to: 'reactions#new_user_reaction', as: 'new_user_reaction'

  post '/new_user_like', to: 'likes#new_user_like', as: 'new_user_like'

  resources :comments, only: [:create]

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.

  # Can be used by load balancers and uptime monitors to verify that the app is live.

  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/*

  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  # Defines the root path route ("/")

  # root "posts#index"

end
