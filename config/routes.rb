Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }
  
  root to: 'toppages#index'
  resources :teams, only: [:index,:create,:destroy]
  
end
