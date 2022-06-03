Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  root 'application#hello'

  resources :users do
    member do
      get :following, :followers
      patch :updateRole
    end
    collection do
      #get : admins
    end
  end

  resources :posts do
    resources :likes
    resources :comments
  end

  get 'login', to:'sessions#new'
  post 'login', to:'sessions#create'
  delete 'logout', to:'sessions#destroy'

  get 'admin/statistics', to:'users#showstatistics'
end
