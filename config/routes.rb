Rails.application.routes.draw do

  devise_for :users
  devise_for :admins

  root to: 'home#index'
  
  namespace :users_dashboard do
    root to: 'home#index'
    resources :recipes    

  end
  
  namespace :admins_dashboard do
    root to: 'home#index'    
    resources :admins
    resources :users    
    resources :recipe_types
    resources :cuisines
    resources :reviews, except: [:new, :create] do
      member do
        get :publish
      end
    end
    resources :recipes, only: [:new, :create, :destroy]

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
