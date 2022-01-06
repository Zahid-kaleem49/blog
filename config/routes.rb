Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  
  root "page#first"
  get "page/second", to: "page#second"
  resources :articles
  # Defines the root path route ("/")
  # root "articles#index"
end
