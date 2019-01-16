Rails.application.routes.draw do
  post '/logout', to: 'sessions#logout', as: 'logout'
  post '/login', to: 'sessions#login', as: 'login'
  post 'users', to: 'users#create'
  get '/profile', to: 'users#view', as: 'profile'
  get 'users/update'
  root 'pages#home'
  get '/mood', to: 'pages#results', as: 'mood'
  post '/mood', to: 'pages#results'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
