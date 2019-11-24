Rails.application.routes.draw do
  get 'likes/create'
  get 'likes/destroy'
  get 'favorites/create'
  get 'favorites/destroy'
  get 'favorites/create'
  get 'favorites/destoroy'
  resources :reviews
  resources :stores
  get 'sessions/new'
  get 'sessions/create'
  get 'sessions/destroy'
  root to: 'toppages#index'
  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
  get 'signup', to: 'users#new'
  resources :users, only: [:index, :show, :new, :create] do
    member do
      get :favorites
      get :likes
    end
  end
  
  resources :stores
  resources :favorites, only: [:create, :destroy]
  
  resources :reviews
  resources :likes, only: [:create, :destroy]
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
