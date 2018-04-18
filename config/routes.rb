Rails.application.routes.draw do
  root 'users#index'

  resources :users
  resources :questions, only: [:edit, :create, :update, :destroy]
  resources :sessions, only: [:new, :create, :destroy]

  get 'sign_up' => 'users#new'
  get 'log_out' => "sessions#destroy"
  get 'log_in' => "sessions#new"
end
