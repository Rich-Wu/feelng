class SpotifyUser < ApplicationRecord
    has_many :entries, dependent: :destroy
    has_many :messages
    has_many :chatrooms, through: :messages
    
    def access_token_expired?
        (Time.now - self.updated_at) > 3300
    end
end
