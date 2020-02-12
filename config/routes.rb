Rails.application.routes.draw do
  resources :comments
  devise_for :users, controllers: { registrations: 'users/registrations' }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get "/", to: "static#home"
  resources :posts
  resources :users
end
