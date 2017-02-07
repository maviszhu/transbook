Rails.application.routes.draw do
  devise_for :users
  resources :carts do
    member do
      post :delete_all_items
      post :delete_item
      post :add_quantity
      post :reduce_quantity
    end
  end
  resources :products, only: [:show] do
    member do
      post :add_to_cart
    end

  end
  namespace :admin do
    resources :products
  end
  get "welcome/index"
  root  "welcome#index"
end
