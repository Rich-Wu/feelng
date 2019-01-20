class SpotifyUser < ApplicationRecord
    has_many :chat_rooms, dependent: :destroy
    has_many :messages, dependent: :destroy

    def access_token_expired?
        (Time.now - self.updated_at) > 3300
    end
end
