class SpotifyUsersController < ApplicationController

  def create
    if params[:error]
      # If there's an error/denial then redirect to root for now
      puts "LOGIN ERROR", params
      redirect_to root_url
    else
      # Else send a request for the access and refresh token
      body = {
        grant_type: "authorization_code",
        code: params[:code],
        redirect_uri: "http://localhost:3000/spotify_users/create",
        client_id: ENV["SPOTIFY_ID"],
        client_secret: ENV["SPOTIFY_SECRET"]
      }

      oauth_response = HTTParty.post("https://accounts.spotify.com/api/token", :body => body)
      oauth_body = JSON.parse(oauth_response.body)
      
      #now send a request for the user's information to save it into the DB
      header = {
        Authorization: "Bearer #{oauth_body["access_token"]}"
      }

      user_response = HTTParty.get("https://api.spotify.com/v1/me", header)
      user_params = JSON.parse(user_response.body)

      @spotify_user = SpotifyUser.find_or_create_by(username: user_params["id"],
        spotify_uri: user_params["external_urls"]["spotify"],
        href: user_params["href"],
        uri: user_params["uri"])
      @spotify_user.update(access_token: oauth_body["access_token"], refresh_token: auth_params["refresh_token"])
    end
  end
end
