Rails.application.routes.draw do

  resources :psts
  get 'users/show'
  root to: 'toppages#index'
  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
  get 'signup', to: 'users#new'
  resources :users do
    member do
      get :favorites
      get :likes
    end
  end
  resources :users, :only => [:show]
  
  resources :stores
  resources :favorites, only: [:create, :destroy]
  
  resources :reviews
  resources :likes, only: [:create, :destroy]
  
  root "psts#index"
  resources :psts
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
