Rails.application.routes.draw do
  get 'users/show'
  get 'items/index'
  get 'ramens/index'
  devise_for :users
  root  'ramens#index'
  resources :users, only: [:show, :edit, :update]
  resources :ramens, only: :index
  resources :items
  
end
