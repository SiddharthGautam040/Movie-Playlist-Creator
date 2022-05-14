Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "sessions#new"
  get "users/new", to: "users#new", as: "new_user"
  post "users", to: "users#create", as: "users"
  get "users/:id", to: "users#show", as: "user"
  get "login", to: "sessions#new"
  post "login", to: "sessions#create"
  delete "logout", to: "sessions#destroy"
  get "search", to: "users#search"
  post "search", to: "users#searchapi"
  get "new/playlists", to: "playlists#new"
  post "new/playlists", to: "playlists#create"
  post "list_item_add", to: "list_items#add_list_item" ,as: "additem"
  delete "list_item_delete", to: "list_items#destroy", as: "deleteitem"
  get "playlists/:id", to: "playlists#show", as: "playlist"
end
