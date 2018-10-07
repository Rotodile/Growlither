Rails.application.routes.draw do
  root 'static_pages#home'
  devise_for :users
  resources :users
  resources :friendships
  resources :friend_requests
  resources :posts,          only: [:create, :destroy]
  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  get 'users/show'
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
