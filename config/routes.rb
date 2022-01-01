Rails.application.routes.draw do
  devise_for :users
  root to: "application#landing"
  # root to: "restaurants#index"
  # get "restaurants", to: "restaurant#index", as: "root"
  get "restaurant/:id", to: "restaurants#show", as: "restaurant_show"
  get "restaurant/:id/checkout", to: "restaurants#checkout", as: "restaurant_checkout"
  post "restaurant/:id", to: "restaurants#create", as: "restaurant_new" 
  post "restaurant/:id", to: "restaurants#update", as: "restaurant_edit" 
  post "restaurant/:id", to: "restaurants#destroy", as: "restaurant_delete"
  post "restaurant/:id", to: "restaurants#order_meal", as: "restaurant_order_meal"

  get "meal/:id", to: "meals#show", as: "meal_show"
  post "meal/:id", to: "meals#create", as: "meal_new" 
  post "meal/:id", to: "meals#update", as: "meal_edit" 
  post "meal/:id", to: "meals#destroy", as: "meal_delete"

  get "order/:id", to: "orders#show", as: "order_show"
  post "order/:id", to: "orders#create", as: "order_new" 
  post "order/:id", to: "orders#update", as: "order_edit" 
  post "order/:id", to: "orders#destroy", as: "order_delete"

  
  get "users/:username/profile", to: "users#user_profile", as: "user_profile"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
