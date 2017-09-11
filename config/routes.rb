Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }, defaults: { format: :json }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  jsonapi_resources :users
  jsonapi_resources :products
  jsonapi_resources :categories
  jsonapi_resources :pictures
end
