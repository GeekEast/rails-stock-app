Rails.application.routes.draw do
  devise_for :users
  get 'about', to: 'home#about'
  root 'home#index'
end
