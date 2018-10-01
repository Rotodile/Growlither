Rails.application.routes.draw do
  root 'static_pages#home'
  get 'static_pages/help'
  resources :friendships, only: [:create, :update, :destroy]
  devise_for :users
  get 'users/new'
  get 'users/index'
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
