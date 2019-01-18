class JournalsController < ApplicationController
  def view
    @entries = Journal.find_by(spotify_user_id: session[:spotify_id]).entries
    if !Journal.find_by(spotify_user_id: session[:spotify_id])
      redirect_to root_path
    end
  end
end
