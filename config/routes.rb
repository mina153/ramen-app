Rails.application.routes.draw do
  get 'blogs/index'
  get 'sharings/index'
  get 'users/show'
  get 'items/index'
  get 'ramens/index'
  devise_for :users
  root  'ramens#index'
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
