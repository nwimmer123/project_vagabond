Rails.application.routes.draw do
	root to: "users#index"

	get '/login', to: 'sessions#new'
	post '/login', to: 'sessions#create'
	get '/logout', to: 'sessions#destroy'
	
	get '/home', to: 'users#index'
  get '/signup', to: 'users#new', as: "new_user"
  post '/users', to: 'users#create'
  get '/users/:id', to: 'users#show', as: 'user_profile'
  get '/users/:id/edit', to: 'users#edit', as: 'edit_user'
  patch '/users/:id', to: 'users#update'
  
  get '/entries', to: 'entries#index', as: "entries"
  # CHANGE THE BELOW PATH ONCE WE ADD CITIES MODEL/CONTROLLER. PATH SHOULD BE '/cities/:city_id/entries/:id'
  get '/entries/:id', to: 'entries#show', as: 'entry'
  get '/entries/:id/edit', to: 'entries#edit', as: "edit_entry"
  patch '/entries/:id', to: 'entries#update'

  get '/cities', to: 'cities#index', as: 'cities'
  get '/cities/:id', to: 'cities#show', as:'city'
  get '/cities/:id/new', to: 'entries#new'
  post '/entries/create', to: 'entries#create'
end