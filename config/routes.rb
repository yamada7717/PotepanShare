Rails.application.routes.draw do
  devise_for :users, controllers: {
  registrations: 'users/registrations'
  }
  root to: "home#index"
  resources :users, only: [:show, :edit, :update] do
    collection do
      get :profile
      get :edit_profile
      patch :update_profile
    end
  end

  resources :rooms do
  resources :reservations, only: [:new, :create]
  end

  resources :reservations do
      collection do
      post :confirmation
    end
  end


  get "/search", to: "rooms#search"
end
