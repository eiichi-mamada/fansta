Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }
  
  root to: 'toppages#index'
  resources :users, only: [:show]
  resources :teams, only: [:index,:create,:destroy,:show, :update]
  resources :posts, except: [:index]

end
