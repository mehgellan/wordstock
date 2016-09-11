Rails.application.routes.draw do
  root to: 'home#index'
  get '/signin' => 'users#new', as: 'new_user'
  post '/users' => 'users#create'
  get '/users/:id' => 'users#show', as: 'user'
  get '/users/:id/edit' => 'users#edit', as: 'edit_user'
  patch '/users/:id' => 'users#update'
  delete '/users/:id' => 'users#destroy'

  get "/login" => 'sessions#new', as: 'login'
  get '/logout' => 'sessions#destroy', as: 'logout'
  post '/sessions' => 'sessions#create'

  get '/users/:user_id/topics' => 'topics#index', as: 'user_topics'
  get '/users/:user_id/topics/new' => 'topics#new', as: 'new_user_topic'
  post '/users/:user_id/topics' => 'topics#create'
  get '/topics/:id' => 'topics#show', as: 'topic'
  get '/topics/:id/edit' => 'topics#edit', as: 'edit_topic'
  patch '/topics/:id' => 'topics#update'
  delete '/topics/:id' => 'topics#destroy'

end
