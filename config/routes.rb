Rails.application.routes.draw do
	root to: "users#index"

	get '/login', to: 'sessions#new', as: 'login'
	post '/login', to: 'sessions#create'
	get '/logout', to: 'sessions#destroy', as: 'logout'
	
	get '/home', to: 'users#index'
  get '/profile', to: "users#profile", as: "my_profile"
  get '/signup', to: 'users#new', as: 'new_user'
  post '/users', to: 'users#create'
  get '/users/:id', to: 'users#show', as: 'user_profile'
  get '/users/:id/edit', to: 'users#edit', as: 'edit_user'
  patch '/users/:id', to: 'users#update'
  
  get '/entries', to: 'entries#index', as: 'entries'
  get '/entries/:id', to: 'entries#show', as: 'entry'
  get '/entries/:id/edit', to: 'entries#edit', as: 'edit_entry'
  patch '/entries/:id', to: 'entries#update'
  delete '/entries/:id', to: 'entries#destroy'

  get '/cities', to: 'cities#index', as: 'cities'
  get '/cities/:id', to: 'cities#show', as:'city'
  get '/cities/:id/new', to: 'entries#new', as:'new_city_entry'
  post '/entries', to: 'entries#create'

end