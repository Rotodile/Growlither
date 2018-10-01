Rails.application.routes.draw do
  root 'static_pages#home'
  get '/help', to: 'static_pages#help'
  resources :friendships, only: [:create, :update, :destroy]
  devise_for :users
  get 'users/new'
  get 'users/index'

  devise_scope :user do 
    get "/users/sign_out" => "devise/sessions#destroy" 
  end
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
