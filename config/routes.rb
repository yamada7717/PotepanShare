Rails.application.routes.draw do
  get 'reservations/index'
  get 'reservations/show'
  get 'reservations/new'
  get 'reservations/edit'
  get 'reservations/create'
  get 'reservations/update'
  get 'reservations/destroy'
  get 'rooms/index'
  get 'rooms/show'
  get 'rooms/new'
  get 'rooms/edit'
  get 'rooms/create'
  get 'rooms/update'
  get 'rooms/destroy'
  devise_for :users
  root to: "home#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
