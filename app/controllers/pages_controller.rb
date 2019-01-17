class PagesController < ApplicationController
  before_action :refresh_token
  helper ApplicationHelper
  def home
    @user = User.new
    render 'home'
  end

  def results
    if !params['mood']
      params['mood'] = 'spooky'
      params['coordinates'] = '40,-74'
    end
    @mood = params['mood']
    # photo API
    @photo = query_unsplash(mood(params['mood']),"landscape")
    # color API
    # music API
    # AUTHORIZE SPOTIFY HERE

    # poetry API
    @poem = query_poetrydb(mood(params['mood']))
    # event API
    @event = query_foursquare(mood(params['mood']),params['coordinates'])
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
