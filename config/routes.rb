Rails.application.routes.draw do
  devise_for :users  
  resources :items do
      resources :shoppings, only: [:index, :create]
  end
  
  root to: 'items#index'

end
