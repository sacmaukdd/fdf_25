Rails.application.routes.draw do
  root "staticpages#index"
  devise_for :users
  namespace :admin do
    resources :categories
    resources :products
    resources :users, only: [:destroy, :index]
  end
  resources :products, only: :show
  resources :users, only: :show
end
