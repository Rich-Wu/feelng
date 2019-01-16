class AddUriToSpotifyUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :spotify_users, :uri, :string
  end
end
