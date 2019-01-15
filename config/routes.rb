Rails.application.routes.draw do
  post 'users', to: 'users#create'
  get 'users/view'
  get 'users/update'
  root 'pages#home'
  get '/mood', to: 'pages#results', as: 'mood'
  post '/mood', to: 'pages#results'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
