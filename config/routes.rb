Rails.application.routes.draw do
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
