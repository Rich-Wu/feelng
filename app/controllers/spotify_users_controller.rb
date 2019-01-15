class SpotifyUsersController < ApplicationController

  def create
    if params[:error]
      puts "LOGIN ERROR", params
      redirect_to root_url
    else
      body = {
        grant_type: "authorization_code",
        code: params[:code],
        redirect_uri: "http://localhost:3000/spotify_users/create",
        client_id: ENV["SPOTIFY_ID"],
        client_secret: ENV["SPOTIFY_SECRET"]
      }

      oauth_response = HTTParty.post("https://accounts.spotify.com/api/token", :body => body)
      body = JSON.parse(oauth_response.body)
      puts body
    end
  end
end
