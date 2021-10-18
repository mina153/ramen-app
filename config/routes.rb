Rails.application.routes.draw do

  root  'ramens#index'
  devise_for :users
  

  resources :chats, only: [:create, :show]

  resources :users, only: [:show, :edit, :update] do
    member do
      get :likes
    end
  end

  resources :ramens, only: :index

  resources :items  do
    resources :comments, only: [:create]
    # get :participations, on: :collection
  end

  resources :items do
    resources :iines, only: [:create, :destroy] 
  end

  resources :sharings, only: [:index]

  resources :events do
    resources :questions, only: [:create]
    resources :likes, only: [:create, :destroy]
  end
  
  resources :plans, only: [:index]
  resources :blogs

  resources :users do
    member do
      get :following, :followers
    end
  end
  resources :relationships, only: [:create, :destroy]
end

