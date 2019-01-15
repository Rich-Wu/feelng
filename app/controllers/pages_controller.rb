class PagesController < ApplicationController
  def home
    render 'home'
  end

  def results
    @mood = params['mood']
    p @mood
    # color API
    # music API
    # Setting up the query params to gain the user's access token
    
    # poetry API
    # event API
    render 'results'
  end

  def playback
    query_params {
      client_id: ENV['SPOTIFY_ID'],
      response_type: 'code',
      redirect_uri: "localhost:3000/",
      scope: "user-library-read",
      show_dialog: true
    }
  end
end

