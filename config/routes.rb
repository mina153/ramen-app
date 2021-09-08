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
    # get :participations, on: :collection
  end

  resources :items 
  resources :sharings, only: [:index]

  resources :events do
    resources :questions, only: [:create]
    # resources :participations, only: [:create, :destroy]
  end
  
end
