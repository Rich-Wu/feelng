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
        # Limit country to US and limit of 50 
        query = {
            "country" => "US",
            "limit" => 50
        }
        # Make sure to authorize the request with the access token
        headers = {
            "Authorization" => "Bearer #{@access_token}"
        }

        playlists = []
        response = HTTParty.get("https://api.spotify.com/v1/browse/categories/#{category_id}/playlists", :query => query, :headers => headers)
        body = JSON.parse(response.body)
        items = body["playlists"]["items"]
        items.each do |item|  
            # Saving IDs to save space
            playlists << item["id"]
        end

        # Return a random playlist id from the list of playlists
        return playlists.sample
    end


end