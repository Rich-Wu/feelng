class MessagesController < ApplicationController
  def create
    message = Message.new(message_params)
    message.spotify_user = helpers.current_spotify_user
    if message.save
      ActionCable.server.broadcast 'messages',
        message: message.body,
        spotify_user: message.spotify_user.display_name
      head :ok
    else
      # do something else message is invalid
    end
  end

  private
    def message_params
      params.require(:message).permit(:body, :chatroom_id)
    end
end
