module ApplicationHelper
    def current_spotify_user
        if session[:spotify_user]
            @spotify_user ||= SpotifyUser.find_by(username: session[:spotify_user])
        else
            @spotify_user = nil
        end
    end
end
