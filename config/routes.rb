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

  resources :comments do
    resources :comments
  end

  resources :patterns do
    resources :comments
  end

  #resources :patterns do
  #  resources :favorite_patterns
  #end

  #resources :users do
  #  resources :needles, :yarns, :other_notions
  #end

end
