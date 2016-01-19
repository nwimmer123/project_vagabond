Rails.application.routes.draw do
	root to: "users#index"

	get '/home', to: 'users#create'
  get '/signup', to: 'users#new', as: "new_user"
  post '/users', to: 'users#create'

end