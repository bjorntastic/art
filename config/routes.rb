Rails.application.routes.draw do
  
  resources :paintings

  get '/login', to: 'access#login'
  post '/login' => 'access#attempt_login'
  get '/register' => 'access#register'
  post '/register' => 'access#create'
  delete '/logout' => 'access#logout'

  root to: 'paintings#index'

end
