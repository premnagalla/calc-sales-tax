Rails.application.routes.draw do
  root 'orders#new'

  resources :orders, except: [:edit, :update]
  resources :categories
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
