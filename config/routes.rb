Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  root to: 'enquetes#index'
  get 'session', to: 'session#index'
  post 'session', to: 'session#create'
  get 'logout', to: 'session#destroy'
  resources :enquetes, only: [:index, :show]
  resources :votos, only: [:create]
end
