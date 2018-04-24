Rails.application.routes.draw do
  root :to => 'questions#index'
  get '/signup' => 'users#new'
  post '/users' => 'users#create'

  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'
  get '/signout' => 'sessions#destroy'

  resources :questions do
    resources :responses
  end
end
