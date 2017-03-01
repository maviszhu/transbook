Rails.application.routes.draw do
  devise_for :users

  resources :carts do
    collection do
      delete :clean
      post :checkout
    end
  end

  resources :products, only: [:index, :show] do
    member do
      post :add_to_cart
    end
  end

  resources :orders do
    member do
      post :pay_with_alipay
      post :pay_with_wechat
    end
  end

  resources :cart_items do
    member do
      post :add_quantity
      post :reduce_quantity
    end
  end

  namespace :admin do
    resources :products do
      member do
        post :publish
        post :hide
      end
    end
    resources :orders do
      member do
        post :cancell
        post :ship
        post :return
      end
    end
  end

  namespace :account do
    resources :orders, only: [:index, :show, :destroy] do
      member do
        post :to_cancell_order
      end
    end
  end

  get "welcome/index"
  root  "products#index"
end
