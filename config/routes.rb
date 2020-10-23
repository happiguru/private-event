Rails.application.routes.draw do
  resources :invitations
  resources :events, only: [:new, :create, :show, :index]
  resources :users
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'users#index'

  get 'login', to: 'session#new'
  post 'login', to: 'session#create'
  post 'logout', to: 'session#destroy'
  
end
