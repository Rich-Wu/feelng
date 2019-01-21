class ChatUser < ApplicationRecord
  belongs_to :chat_room
  belongs_to :spotify_user
end
