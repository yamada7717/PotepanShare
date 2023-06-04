Rails.application.routes.draw do
  devise_for :users, controllers: {
  registrations: 'users/registrations'
  }
  root to: "home#index"
  resources :users, only: [:show, :edit, :update]
  resources :rooms
  resources :reservations
end
