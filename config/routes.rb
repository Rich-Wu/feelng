Rails.application.routes.draw do
  get 'spotify_users/create'
  get 'spotify_logins/create'
  root 'pages#home'
  get '/mood', to: 'pages#results', as: 'mood'
  post '/mood', to: 'pages#results'
  get '/playback', to: 'pages#playback', as: 'playback'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
