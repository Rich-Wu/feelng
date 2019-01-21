class CreateChatUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :chat_users do |t|
      t.references :chat_room, foreign_key: true
      t.references :spotify_user, foreign_key: true

      t.timestamps
    end
  end
end
