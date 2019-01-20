module ApplicationHelper
    def current_spotify_user
        if session[:spotify_user]
            @spotify_user ||= SpotifyUser.find_by(username: session[:spotify_user])
        else
            @spotify_user = nil
        end
    end

    def get_playlist_by_id(playlist_id)
        query = {
            "q" => music(mood(params['mood'])),
            "type" => "playlist",
            "limit"=> 50
          }
      
          user_headers = {
            "Authorization" => "Bearer #{helpers.current_spotify_user.access_token}"
          }
          search_response = HTTParty.get("https://api.spotify.com/v1/search", :query => query, :headers => user_headers)
    end
end
