Rails.application.routes.draw do
  resources :questions

  get 'pages/welcome'

  root 'pages#welcome'

  get '/signup' => 'users#new'
  post '/users' => 'users#create'
  get '/login' => 'session#new'
  post '/login' => 'session#create'
  get '/logout' => 'session#destroy'
end
