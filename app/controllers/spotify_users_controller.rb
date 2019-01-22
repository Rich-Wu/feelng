class SpotifyUsersController < ApplicationController
  before_action :set_user, only: [:view, :logout]
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
      puts "This is oauth body", oauth_body
      #now send a request for the user's information to save it into the DB
      headers = {
        Authorization: "Bearer #{oauth_body["access_token"]}"
      }

      user_response = HTTParty.get("https://api.spotify.com/v1/me", :headers => headers)
      user_params = JSON.parse(user_response.body)
      puts "This is user params", user_params
      @spotify_user = SpotifyUser.find_or_create_by(username: user_params["id"],
        spotify_uri: user_params["external_urls"]["spotify"],
        href: user_params["href"],
        uri: user_params["uri"])
      @spotify_user.update(access_token: oauth_body["access_token"], refresh_token: oauth_body["refresh_token"], display_name: user_params["display_name"])
      session[:spotify_user] = @spotify_user.username
      redirect_to root_url
    end
  end

  def view

  end

  def logout
    session[:spotify_user] = nil
    redirect_to root_path
  end

  private
  def set_user
    @spotify_user = SpotifyUser.find_by(username: session[:spotify_user])
  end
end
