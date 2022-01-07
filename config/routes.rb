Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  
  root "page#first"
  get "page/second", to: "page#second"
  resources :articles
  get 'user/signup', to: 'users#signup'
  post 'users', to: 'users#create'
  get 'user/show', to: 'users#show'
  # Defines the root path route ("/")
  # root "articles#index"
end
