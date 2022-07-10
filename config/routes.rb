Rails.application.routes.draw do
  devise_for :admins
  devise_for :doctors
  devise_for :users

  root 'home#index'

  namespace :admins do
    get '/', to: 'admin#index'
    resources :doctors, only: [:index, :new, :edit, :create, :update, :destroy]
    resources :categories, only: [:index, :new, :edit, :create, :update, :destroy]
    resources :users, only: [:index, :destroy]
  end
end
