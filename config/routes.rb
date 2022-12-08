Rails.application.routes.draw do


  resources :colleges
  resources :team_participants
  resources :teams
  resources :programs
  resources :events
  resources :user_details
  resources :members
  resources :departments
  resources :admins
  resources :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  get '/teamsize/:id', to: 'programs#teamsize'

  post '/participants', to: 'participant#create'

  get '/password_auth', to: 'users#login_auth'
  get '/phone_auth', to: 'users#login_phone_auth'

  get '/getp', to: 'team_participants#export'
  get '/admin_login', to: 'users#admin_login'

  get '/get_program_insight/:id', to: 'programs#get_program_insights'

  get '/toggle/:id/:username/:password', to: 'programs#toggle'

  # Defines the root path route ("/")
  # root "articles#index"
end
