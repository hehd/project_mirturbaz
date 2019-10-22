Rails.application.routes.draw do
  root to: 'main#index'
  resources :countries
  resources :regions
  resources :cities
  resources :camps
  get 'main/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
