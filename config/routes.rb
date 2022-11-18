Rails.application.routes.draw do
  resources :beavers
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "beavers#index"
end
