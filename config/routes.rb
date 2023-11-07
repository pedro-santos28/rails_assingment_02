Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "home#index"

  get "posts", to: "posts#new"
  post "posts", to: "posts#create"
  get "posts/:id/show", to: "posts#show", as: "show_posts"
  get "posts/:id/edit", to: "posts#edit", as: "edit_posts"
  patch "posts/:id/edit", to: "posts#update", as: "update_posts"

  get "registrations", to: "registrations#new"
  post "registrations", to: "registrations#create"

  get "sessions", to: "sessions#new"
  post "sessions", to: "sessions#create"
  delete "sessions", to: "sessions#destroy"
end
