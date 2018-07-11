Rails.application.routes.draw do
  get '/auth/:provider/callback', to: 'sessions#create'
  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'
  delete '/signout' => 'sessions#destroy'

  root "application#welcome"

  resources :users
  resources :patterns

  resources :patterns do
    resources :comments
  end

  resources :patterns do
    put :favorite, on: :member
  end

  put "/patterns/:id/favorite", to: "patterns#favorite"
  delete "/patterns/:id/unfavorite", to: "patterns#unfavorite", as: "unfavorite_pattern"
  get "/patterns/:id/favorite_patterns/:id", to: "patterns#show", as: "favorite_patterns"

  post "favorite_patterns/:pattern_id" => "favorite_patterns#create", :as => :favorited

  get "/patterns/:id/next", to: "patterns#next"
end
