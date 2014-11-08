Rails.application.routes.draw do

  devise_for :admin_users, ActiveAdmin::Devise.config

  ActiveAdmin.routes(self)

  resources :products, only: [:index, :show]

  get '/' => 'high_voltage/pages#show', id: 'home'
  
end
