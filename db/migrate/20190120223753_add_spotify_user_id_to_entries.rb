class AddSpotifyUserIdToEntries < ActiveRecord::Migration[5.2]
  def change
    add_column :entries, :spotify_user_id, :integer
  end
end
