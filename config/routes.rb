Rails.application.routes.draw do
  resources :lists
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root "lists#index"
  get "uncompleted" => "lists#uncompleted"
  get "completed" => "lists#completed"
  # Defines the root path route ("/")
  delete "delete_all" => "lists#delete_all"
  # root "articles#index"
  post "search" => "lists#search"
  delete "delete_all_items" => "lists#delete_all_items"
end
