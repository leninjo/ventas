Rails.application.routes.draw do
  devise_for :models
  devise_for :users, controllers: {
    registrations: 'registrations'
  }

  root "pages#home"

  resources :categories
  resources :clients 
  resources :products
  resources :suppliers
  resources :sales
end
