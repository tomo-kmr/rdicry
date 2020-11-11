Rails.application.routes.draw do
  devise_for :users
  root to: 'codes#index'
  resources :codes do
    collection do
      get 'search'
    end
  end
  resources :users, only: [:index]
end
