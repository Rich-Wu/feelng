class Message < ApplicationRecord
  belongs_to :chatroom
  belongs_to :spotify_user
end
