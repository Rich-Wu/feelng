class PagesController < ApplicationController
  before_action :refresh_token
  helper ApplicationHelper
  def home
    render 'home'
  end

  def results
    @mood = params['mood']
    p @mood
    # color API
    # music API
    # AUTHORIZE SPOTIFY HERE
    
    # poetry API
    # event API
    render 'results'
  end


  private
    def refresh_token
      if helpers.current_spotify_user && helpers.current_spotify_user.access_token_expired?
          body = {
              grant_type: "refresh_token",
              refresh_token: helpers.current_spotify_user.refresh_token,
              client_id: ENV["SPOTIFY_ID"],
              client_secret: ENV["SPOTIFY_SECRET"]
          }

          auth_response = HTTParty.post("https://accounts.spotify.com/api/token", :body=>body)
          auth_params = JSON.parse(auth_response.body)
          helpers.current_spotify_user.update(access_token: auth_params["access_token"])
      
      else
          puts "Token is good"
      end
    end

end

