Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users

  get "/signin", to: "sessions#new"
  post "/sessions", to: "sessions#create"
  delete "/signout", to: "sessions#destroy"

  get "/auth/:provider/callback", to: "sessions#create"
  get "auth/failure", to: redirect('/')

  root "application#welcome"
end
