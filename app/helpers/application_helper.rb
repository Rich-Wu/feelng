module ApplicationHelper
    def current_spotify_user
        if session[:spotify_user]
            @spotify_user ||= SpotifyUser.find_by(username: session[:spotify_user])
        else
            OpenStruct.new(name :'')
        end
    end
end
