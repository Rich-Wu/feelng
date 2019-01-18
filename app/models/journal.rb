class Journal < ApplicationRecord
  has_many :entries
  belongs_to :spotify_user
end
