Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }
  
  root to: 'toppages#index'
  resources :users, only: [:show] do
    member do
      get :followings
      get :fan_teams
      get :posts
    end
  end
  
  resources :teams, only: [:index, :create, :destroy, :show, :update] 
  resources :fan_teams, only:[:create, :destroy]
  resources :posts, except: [:index] do 
    resources :messages, only:[:create, :destroy]
  end
  resources :favorites, only:[:create, :destroy]
  resources :relationships, only: [:create, :destroy]

end
