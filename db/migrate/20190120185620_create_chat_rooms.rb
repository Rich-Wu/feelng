class CreateChatRooms < ActiveRecord::Migration[5.2]
  def change
    create_table :chat_rooms do |t|
      t.string :title
      t.references :spotify_user, foreign_key: true

      t.timestamps
    end
  end
end
