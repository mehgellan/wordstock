Rails.application.routes.draw do
  root 'users#new'

  get '/signin' => 'users#new', as: 'new_user'
  post '/users' => 'users#create'
  get '/users/:id' => 'users#show', as: 'user'
  get '/users/:id/edit' => 'users#edit', as: 'edit_user'
  patch '/users/:id' => 'users#update'
  delete '/users/:id' => 'users#destroy'

  get "/login" => 'sessions#new', as: 'login'
  get '/logout' => 'sessions#destroy', as: 'logout'
  post '/sessions' => 'sessions#create'

  namespace :api, defaults: { format: :json } do
    resources :topics do
      resources :words, shallow: true
    end
  end

  # get '/topics/:id' => 'topics#show', as: 'topic'
  # delete '/topics/:id' => 'topics#destroy'

  # get '/users/:user_id/topics' => 'topics#index', as: 'user_topics'
  # get '/users/:user_id/topics/new' => 'topics#new', as: 'new_user_topic'
  # post '/users/:user_id/topics' => 'topics#create'
  # get '/topics/:id' => 'topics#show', as: 'topic'
  # get '/topics/:id/edit' => 'topics#edit', as: 'edit_topic'
  # patch '/topics/:id' => 'topics#update'
  # delete '/topics/:id' => 'topics#destroy'
  #
  # get '/topics/:topic_id/words' => 'words#index', as: 'topic_words'
  # get '/topics/:topic_id/words/new' => 'words#new', as: 'new_topic_word'
  # post '/topics/:topic_id/words' => 'words#create'
  # get '/words/:id' => 'words#show', as: 'word'
  # get '/words/:id/edit' => 'words#edit', as: 'edit_word'
  # patch '/words/:id' => 'words#update'
  # delete '/words/:id' => 'words#destroy'

  get '*path' => 'site#index'
end
