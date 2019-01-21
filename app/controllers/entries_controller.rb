class EntriesController < ApplicationController
  before_action :set_entry, only: [:show]
  def create
    @entry = helpers.current_spotify_user.entries.create(entry_params)
    redirect_to entry_path @entry
  end

  def show
    @mood = @entry.mood
    @photo = JSON.parse(@entry.photo)
    @poem = JSON.parse(@entry.poem)
    @event = JSON.parse(@entry.event)
    @playlist = JSON.parse(@entry.playlist)
    @playlist_img = @playlist["images"][0]["url"]
    @playlist_name = @playlist["name"]
    @playlist_uri = @playlist["uri"]
    @playlist_id = @playlist["id"]
    @chatroom = Chatroom.find_or_create_by(mood: mood(@mood))
    @message = Message.new
    render :template => 'pages/results'
    
  end

  def delete
  end

  private
  
  def set_entry
    @entry = Entry.find(params[:id])
  end
  def entry_params
    params.require(:entry).permit(:mood, :photo, :poem, :event, :playlist)
  end
end
