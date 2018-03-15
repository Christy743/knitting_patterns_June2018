Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #get "/signup", to: "users#new"
  get "/auth/:provider/callback", to: "sessions#create"

  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'
  #post '/sessions' => 'sessions#create'
  delete '/signout' => 'sessions#destroy'

  root "application#welcome"

  resources :users
  resources :patterns
  #resources :favorite_patterns

  resources :patterns do
    resources :comments
  end

  #resources :users do
  #  resources :comments
  #end

  resources :user do
    resources :comments, only: [:new, :create]
  end

  resources :comments do
    resources :comments
  end

  resources :patterns do
    put :favorite, on: :member
  end

  #resources :patterns do
  #put :favorite_pattern_id/:favorite/:userid
  #delete :favorite_pattern_id/:favorite/:userid
  #end

  put "/patterns/:id/favorite", to: "patterns#favorite"

  delete "/patterns/:id/unfavorite", to: "patterns#unfavorite", as: "unfavorite_pattern"

  get "/patterns/:id/favorite_patterns", to: "patterns#show", as: "favorite_patterns"
  #resources :favorite_patterns do
  #  #binding.pry
  #  put :member do
  #    put "favorite" => "patterns#create"
  #    destroy "unfavorite" => "patterns#destroy"
  #  end
  #  put "favorite", on: :member
  #end

  #resources :patterns do
  #  match :favorite, on: :member, via: [:put, :delete]
  #end

  #post 'patterns/:id/favorite', to: 'patterns#favorite'

  #resources :patterns do
  #  resources :favorite_patterns
  #end

  #resources :users do
  #  resources :needles, :yarns, :other_notions
  #end

end
