class ChatRoom < ApplicationRecord
  belongs_to :spotify_user
  has_many :messages, dependent: :destroy
end
