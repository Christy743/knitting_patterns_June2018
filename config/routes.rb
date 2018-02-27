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
  resources :comments
  resources :categories
end
