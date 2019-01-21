Rails.application.routes.draw do
  mount ActionCable.server => '/cable'
  
  post '/messages', to: 'messages#create', as: 'new_message'
  
  get '/entries/:id', to: 'entries#show', as: "entry"
  post '/entries', to: 'entries#create', as: 'new_entry'

  post '/logout', to: 'sessions#logout', as: 'logout'
  post '/login', to: 'sessions#login', as: 'login'
  post '/users', to: 'users#create'

  get '/profile', to: 'users#view', as: 'profile'
  get 'users/update'
  get 'spotify_users/create'
  get 'spotify_logins/create'
  root 'pages#home'
  get '/test', to: 'pages#calendar'
  get '/mood', to: 'pages#results', as: 'mood'
  post '/mood', to: 'pages#results'
  get '/playback', to: 'pages#playback', as: 'playback'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
