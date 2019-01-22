class AddDisplayNameToSpotifyUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :spotify_users, :display_name, :string
  end
end
