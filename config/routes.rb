Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  jsonapi_resources :users
  jsonapi_resources :products
  jsonapi_resources :categories
end
