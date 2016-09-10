Rails.application.routes.draw do
  root to: 'users#new'
  get '/signin' => 'users#new', as: 'new_user'
  post '/users' => 'users#create'
  get '/users/:id' => 'users#show', as: 'user'

  get "/login" => 'sessions#new', as: 'login'
  post "/sessions" => "sessions#create"
end
