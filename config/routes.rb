Rails.application.routes.draw do
  root to: "restaurant#index"
  # get 'restaurants', to: "restaurant#index", as: "root"
  get 'restaurant/:id', to: "restaurant#show", as: "show"
  post "restaurant/:id", to: "restaurant#create", as: "new" 
  post "restaurant/:id", to: "restaurant#update", as: "edit" 
  post 'restaurant/:id', to: "restaurant#destroy", as: "delete"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
