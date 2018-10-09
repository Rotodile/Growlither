Rails.application.routes.draw do
  root 'static_pages#home'
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  resources :users
  resources :friendships
  resources :friend_requests
  resources :account_activations, only: [:edit]
  resources :posts,          only: [:create, :destroy]
  get '/help', to: 'static_pages#help'
  get '/posts', to: 'posts#index'
  resources :posts do
    resources :likes
    resources :comments
  end

  resources :comments do
    resources :comments
  end
  
  devise_scope :user do 
    get "/users/sign_out" => "devise/sessions#destroy" 
  end
end
