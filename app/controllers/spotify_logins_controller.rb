class SpotifyLoginsController < ApplicationController
  def create
    query_params = {
      client_id: ENV['SPOTIFY_ID'],
      response_type: 'code',
      # Replace the redirect URI to the url responsible for saving usrs tokens
      scope: "streaming user-read-birthdate user-read-email user-read-private user-modify-playback-state",
      show_dialog: true
    }
    if Rails.env.production?
      query_params[:redirect_uri] = "http://feelng.herokuapp.com/spotify_users/create"
    else
      query_params[:redirect_uri] = "http://localhost:3000/spotify_users/create"
    end

    puts query_params
    
    url = "https://accounts.spotify.com/authorize/"
    puts "#{url}?#{query_params.to_query}"
    redirect_to "#{url}?#{query_params.to_query}"
  end
end
