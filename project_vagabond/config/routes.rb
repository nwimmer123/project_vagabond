Rails.application.routes.draw do
	root to: "users#index"

	get '/login', to: 'sessions#new'
	post '/login', to: 'sessions#create'
	get '/logout', to: 'sessions#destroy'
	
	get '/home', to: 'users#create'
  get '/signup', to: 'users#new', as: "new_user"
  post '/users', to: 'users#create'

end