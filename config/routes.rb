Rails.application.routes.draw do
  root 'users#index'

  resources :users
  resources :questions, only: [:edit, :create, :update, :destroy]
  resource :session, only: [:new, :create, :destroy]
  resources :hashtags, only: [:show], param: :name
end
