class AddSpotifyUserIdToJournals < ActiveRecord::Migration[5.2]
  def change
    add_column :journals, :spotify_user_id, :integer
  end
end
