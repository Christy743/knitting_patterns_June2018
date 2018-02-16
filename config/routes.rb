Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users

  get "/signin", to: "sessions#new"
  post "/signin", to: "sessions#create"
  delete "/signout", to: "sessions#destroy"

  get "/auth/facebook/callback" => "sessions#create"
  get "/auth/twitter/callback" => "sessions#create"

  root "application#welcome"
end
