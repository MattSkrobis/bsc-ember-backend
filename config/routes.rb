Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }, defaults: { format: :json }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  jsonapi_resources :users
  jsonapi_resources :products
  jsonapi_resources :categories
  jsonapi_resources :pictures
  jsonapi_resources :orders
  jsonapi_resources :order_lines
  jsonapi_resources :questions
  jsonapi_resources :answers
  jsonapi_resources :messages
  jsonapi_resources :replies
  jsonapi_resources :user_answers

  namespace :mailer do
    resource :reply, only: :create
  end
end
