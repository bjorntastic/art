Rails.application.routes.draw do
  
  resources :paintings do
    member do
      get :like
    end
  end

  get '/login', to: 'access#login'
  post '/login' => 'access#attempt_login'
  get '/register' => 'access#register'
  post '/register' => 'access#create'
  delete '/logout' => 'access#logout'

  get '/profile' => 'access#edit'
  patch '/profile' => 'access#update'

  root to: 'paintings#index'

end
