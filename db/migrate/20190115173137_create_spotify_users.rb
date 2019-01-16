class CreateSpotifyUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :spotify_users do |t|
      t.string :access_token
      t.string :refresh_token
      t.string :username

      t.timestamps
    end
  end
end
