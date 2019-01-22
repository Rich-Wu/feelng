Rails.application.routes.draw do
  post '/logout', to: 'spotify_users#logout', as: 'logout'
  # get '/entries/:id', to: 'entries#read', as: "entry"
  get 'entries/delete'
  mount ActionCable.server => '/cable'
  post '/messages', to: 'messages#create', as: 'new_message'
  get '/entries/:id', to: 'entries#show', as: "entry"
  get 'users/update'
  post '/entries', to: 'entries#create', as: 'new_entry'
  get '/profile', to: 'spotify_users#view', as: 'profile'
  get 'spotify_users/create'
  get 'spotify_logins/create'
  root 'pages#home'
  get '/calendar', to: 'pages#calendar'
  get '/mood', to: 'pages#results', as: 'mood'
  post '/mood', to: 'pages#results'
  get '/playback', to: 'pages#playback', as: 'playback'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
