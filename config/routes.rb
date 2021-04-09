Rails.application.routes.draw do
  root 'users#index'

  resources :posts
  resources :users, only: [:show, :edit, :update]
end
