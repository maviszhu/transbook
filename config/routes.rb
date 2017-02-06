Rails.application.routes.draw do
  devise_for :users
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
