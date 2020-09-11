Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }
  
  root to: 'toppages#index'
  resources :users, only: [:show] do
    member do
      get :followings
      get :followers
    end
  end
  
  get '/user_posts/:id', to: 'users#user_posts', as: 'user_posts'
  resources :teams, only: [:index, :create, :destroy, :show, :update] 
  resources :fan_teams, only:[:create, :destroy]
  resources :posts, except: [:index]
  resources :favorites, only:[:create, :destroy]
  resources :relationships, only: [:create, :destroy]

end
