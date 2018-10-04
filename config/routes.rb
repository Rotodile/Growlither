Rails.application.routes.draw do
  get '/help', to: 'static_pages#help'
  devise_for :users
  get 'users/new'
  get 'users/show'
  resources :friendships
  resources :friend_requests
  get 'users/index'
  get '/index', to:'static_pages#index'
  root 'static_pages#home'
  devise_scope :user do 
    get "/users/sign_out" => "devise/sessions#destroy" 
  end
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
