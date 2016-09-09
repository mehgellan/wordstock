Rails.application.routes.draw do
  root to: "users#index"
  # resources :users, except: [:index] do
  #   resources :topics, shallow: true do
  #   end
  # end
end
