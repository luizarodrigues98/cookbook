Rails.application.routes.draw do
  namespace :users_backoffice do
    get 'welcome/index'
  end
  namespace :admins_backoffice do
    get 'welcome/index'
  end
  devise_for :users
  devise_for :admins
  root to: 'home#index'
  
  resources :recipes, except: :destroy do
    member do
      patch :publish
      patch :draft
    end
  end
  resources :recipe_types, only: [:new, :create]
  resources :cuisines, only: [:new, :create]

end
