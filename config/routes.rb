Rails.application.routes.draw do
  resources :doctors
  resources :users
  resources :hello_world
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
