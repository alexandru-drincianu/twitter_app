Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root 'application#hello'
  get 'alta_ruta', to: 'application#alta_ruta'
  get 'create_user', to: 'application#create_user'
  get 'main_menu', to:'application#main_menu'
  get 'users', to:'users#index'
  get 'users/:id', to:'users#show'
end
