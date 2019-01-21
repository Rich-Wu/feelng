class MessagesController < ApplicationController
  def create
    message = Message.new(message_params)
    message.user = current_spotify_user
    if message.save
      ActionCable.server.broadcast 'messages',
        message: message.content,
        spotify_user: message.spotify_user.username
      head :ok
    else
      # do something else message is invalid
    end
  end

  private
    def message_params
      params.require(:message).permit(:content, :chatroom_id)
    end
end
