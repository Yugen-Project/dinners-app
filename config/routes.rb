Rails.application.routes.draw do
  root to: "restaurants#index"
  # get 'restaurants', to: "restaurant#index", as: "root"
  get 'restaurant/:id', to: "restaurants#show", as: "restaurant_show"
  post "restaurant/:id", to: "restaurants#create", as: "restaurant_new" 
  post "restaurant/:id", to: "restaurants#update", as: "restaurant_edit" 
  post 'restaurant/:id', to: "restaurants#destroy", as: "restaurant_delete"

  get 'meal/:id', to: "meals#show", as: "meal_show"
  post "meal/:id", to: "meals#create", as: "meal_new" 
  post "meal/:id", to: "meals#update", as: "meal_edit" 
  post 'meal/:id', to: "meals#destroy", as: "meal_delete"

  get 'order/:id', to: "orders#show", as: "order_show"
  post "order/:id", to: "orders#create", as: "order_new" 
  post "order/:id", to: "orders#update", as: "order_edit" 
  post 'order/:id', to: "orders#destroy", as: "order_delete"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
