Rails.application.routes.draw do
  resources :establishments
  resources :doctors
  resources :users
  resources :hello_world
  post '/login', to: 'login#login'
  get '/auth' ,to: 'login#persist'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
