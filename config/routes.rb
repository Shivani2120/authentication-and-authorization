Rails.application.routes.draw do
  devise_for :users
  # resources :products
  root 'dashboard#index'

  resources :products do
    collection { post :import }
  end
end
