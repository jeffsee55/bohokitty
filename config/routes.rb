Rails.application.routes.draw do

  devise_for :admin_users, ActiveAdmin::Devise.config

  ActiveAdmin.routes(self)

  resources :products, only: [:index, :show]
  resources :carts, only: [:show, :destroy]
  resources :cart_products, only: [:create, :destroy]
  resources :charges, only: [:new, :create, :show]

  get '/' => 'high_voltage/pages#show', id: 'home'

end
