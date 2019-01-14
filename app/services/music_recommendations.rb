require 'httparty'
require 'base64'

class MusicRecommendations 
    
    def initialize
        body = {
            "grant_type" => "client_credentials"
        }
        credentials = "60a9a07eff2c457ab881003fd346e59a:244ee2cf31e447018353cbed875dce5c"
        enc = Base64.encode64(credentials)
        enc = enc.gsub(/\s+/,"")
        puts enc
        headers = {
            "Authorization" => "Basic #{enc}"
        }
        response = HTTParty.post("https://accounts.spotify.com/api/token", :body => body, :headers => headers)     
        puts response.body, response.code, response.message, response.headers.inspect

    end

end