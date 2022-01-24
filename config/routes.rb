Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  
  root "pages#first"
  get "page/second", to: "pages#second"
  resources :articles
  resources :users 
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to:'sessions#destroy'
  # Defines the root path route ("/")
  # root "articles#index"
end
