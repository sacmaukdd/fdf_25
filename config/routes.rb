Rails.application.routes.draw do
  post "/rate" => "rater#create", as: "rate"
  root "staticpages#index"
  devise_for :users
  namespace :admin do
    resources :categories
    resources :products
    resources :users, only: [:destroy, :index]
  end
  resources :products do
    collection do
      match "search" => "staticpages#index", via: [:get, :post], as: :search
    end
  end
  resources :users, only: :show
  resources :comments
  resources :carts
  resources :products, only: [:show, :destroy]
  resources :suggests
end
