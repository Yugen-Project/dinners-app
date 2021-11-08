Rails.application.routes.draw do
  # root 'restaurant/index'
  get 'restaurant/index'
  get 'restaurant/show'
  get 'restaurant/create'
  get 'restaurant/update'
  get 'restaurant/destroy'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
