Rails.application.routes.draw do
  devise_for :users  
  references :items
  root to: 'items#index'

end
