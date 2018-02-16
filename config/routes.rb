Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users

  get "/signin", to: "sessions#new"
  post "/signin", to: "sessions#create"
  delete "/signout", to: "sessions#destroy"

  #get "/auth/:provider/callback" => "sessions#create_twitter"

  #get "/auth/facebook/callback" => "sessions#create_facebook"
  get "/auth/twitter/callback" => "sessions#create_twitter"

  root "application#welcome"
end
