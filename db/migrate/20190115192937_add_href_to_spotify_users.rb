class AddHrefToSpotifyUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :spotify_users, :href, :string
  end
end
