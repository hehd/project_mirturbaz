Rails.application.routes.draw do
  root "countries#index"
  resources :countries
  resources :regions
  resources :cities
  resources :camps
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
