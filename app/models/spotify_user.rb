class SpotifyUser < ApplicationRecord
    has_many :entries, dependent: :destroy
    def access_token_expired?
        (Time.now - self.updated_at) > 3300
    end
end
