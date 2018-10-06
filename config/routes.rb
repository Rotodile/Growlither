Rails.application.routes.draw do
  root 'static_pages#home'
  devise_for :users
  resources :users
  resources :friendships
  resources :friend_requests
  resources :posts,          only: [:create, :destroy]
  get 'users/show'
  get '/help', to: 'static_pages#help'

  devise_scope :user do 
    get "/users/sign_out" => "devise/sessions#destroy" 
  end
end
