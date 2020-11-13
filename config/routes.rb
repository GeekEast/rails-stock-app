Rails.application.routes.draw do
  resources :stocks
  devise_for :users
  get 'about', to: 'home#about'
  root 'home#index'
end
