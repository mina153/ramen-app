Rails.application.routes.draw do
  get 'sharings/index'
  get 'users/show'
  get 'items/index'
  get 'ramens/index'
  devise_for :users
  root  'ramens#index'
  resources :users, only: [:show, :edit, :update]
  resources :ramens, only: :index

  resources :items  do
    resources :comments, only: [:create]
  end

  resources :items 
  resources :sharings

  resources :events do
    resources :questions, only: [:create]
  end
  
end
