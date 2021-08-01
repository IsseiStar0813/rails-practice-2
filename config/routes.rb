Rails.application.routes.draw do
  get 'users/new'
  root "static_pages#home"
  get "/about", to: "static_pages#about"
  get "/signup", to: "users#new"
  resources:users, except: [:index]
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
  resources:microposts, only: [:create, :destroy]
end
