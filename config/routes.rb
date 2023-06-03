Rails.application.routes.draw do
  get 'reservations/index'
  get 'reservations/show'
  get 'reservations/new'
  get 'reservations/edit'
  get 'reservations/create'
  get 'reservations/update'
  get 'reservations/destroy'
  devise_for :users
  root to: "home#index"
  resources :rooms
  resources :reservations
end
