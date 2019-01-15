require 'httparty'
require 'json'

class MusicRecommendations 
    include HTTParty
    format :json

    def initialize
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
        @access_token = body["access_token"]
    end

    def get_categories
        categories = []
        query = {
            "limit" => 50,
            "offset" => 0
        }

        headers = {
            "Authorization" => "Bearer #{@access_token}"
        }
        response = HTTParty.get("https://api.spotify.com/v1/browse/categories", :query => query, :headers => headers)
        body = JSON.parse(response.body)
        items = body["categories"]["items"]
        items.each do |item| 
            categories << item["id"]
        end
        puts categories
    end

    def get_category_playlist(category_id) 
        query = {
            "country" => "US",
            "limit" => 50
        }
        response = HTTParty.get("https://api.spotify.com/v1/browse/categories/#{category_id}/playlists")
        body = JSON.parse(response.body)
        playlists = body["playlists"]
        
    end
end