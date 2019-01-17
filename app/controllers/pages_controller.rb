class PagesController < ApplicationController
  before_action :refresh_token
  helper ApplicationHelper
  def home
    @user = User.new
    render 'home'
  end

  def results
    @mood = params['mood']
    # photo API
    #@photo = query_unsplash(mood(params['mood']),"portrait")
    # color API

    # music API
    id = ENV["SPOTIFY_ID"]
  secret = ENV["SPOTIFY_SECRET"]
  credentials = "#{id}:#{secret}"
  # encode the string to base 64
  enc = Base64.encode64(credentials)
  enc = enc.gsub(/\s+/,"")

  body = {
      "grant_type" => "client_credentials"
  }
  
  headers = {
      "Authorization" => "Basic #{enc}"
  }
  # make the post request with required body and header parameters
  response = HTTParty.post("https://accounts.spotify.com/api/token", :body => body, :headers => headers)     
  body = JSON.parse(response.body)
  # set the access token for future calls
  @client_access_token = body["access_token"]

  query = {
    "q" => music(mood(params['mood'])),
    "type" => "playlist",
    "limit"=> 50
  }

  user_headers = {
    "Authorization" => "Bearer #{helpers.current_spotify_user.access_token}"
  }
  search_response = HTTParty.get("https://api.spotify.com/v1/search", :query => query, :headers => user_headers)
  body = JSON.parse(search_response.body)
  items = body["playlists"]["items"]
  
  playlists = []

  items.each do |item|  
    # Saving IDs to save space
    playlists << item
  end

  @playlist = Hash[playlists.to_a.sample]
  puts "This is the playlist #{@playlist}"
    @playlist_img = @playlist["images"][0]["url"]
    @playlist_name = @playlist["name"]
    @playlist_uri = @playlist["uri"]
    
    # poetry API
    # event API
   # @event = query_foursquare(mood(params['mood']),params['coordinates'])
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

