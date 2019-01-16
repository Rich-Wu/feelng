class AddSpotifyUriToSpotifyUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :spotify_users, :spotify_uri, :string
  end
end
