Rails.application.routes.draw do

  devise_for :admin_users, ActiveAdmin::Devise.config

  ActiveAdmin.routes(self)

  resources :customers, only: [:new, :create]
  resources :products, only: [:index, :show]
  resources :charges, only: [:new, :create, :show]
  resources :cart_sessions, only: [:create, :update, :show]

  get 'cart' => 'cart_sessions#show', as: 'cart'
  post 'add_item' => 'cart_sessions#add_item', as: 'add_item'
  post 'remove_item' => 'cart_sessions#remove_item', as: 'remove_item'
  delete 'empty_cart' => 'cart_sessions#destroy', as: 'empty_cart'
  get '/' => 'high_voltage/pages#show', id: 'home'

end
