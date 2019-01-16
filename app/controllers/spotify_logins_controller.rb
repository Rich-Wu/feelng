class SpotifyLoginsController < ApplicationController
  def create
    query_params = {
      client_id: ENV['SPOTIFY_ID'],
      response_type: 'code',
      # Replace the redirect URI to the url responsible for saving usrs tokens
      redirect_uri: "http://localhost:3000/spotify_users/create",
      scope: "streaming user-read-birthdate user-read-email user-read-private user-modify-playback-state",
      show_dialog: true
    }

    url = "https://accounts.spotify.com/authorize/"
    puts "#{url}?#{query_params.to_query}"
    redirect_to "#{url}?#{query_params.to_query}"
  end
end
