Rails.application.routes.draw do
  devise_for :users
  root to: 'tweets#index'
  resources :tweets, only: [:index, :new, :create]
   resources :users, only: [:show] do
  resource :relationships, only: [:create, :destroy]
end
end
