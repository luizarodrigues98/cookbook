Rails.application.routes.draw do
  devise_for :users
  devise_for :admins

  root to: 'home#index'
  
  namespace :users_dashboard do
    root to: 'home#index'
  end
  
  namespace :admins_dashboard do
    root to: 'home#index'
  end
  
  resources :recipes, except: :destroy do
    member do
      patch :publish
      patch :draft
    end
  end
  resources :recipe_types, only: [:new, :create]
  resources :cuisines, only: [:new, :create]
end
