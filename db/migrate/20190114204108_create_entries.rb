class CreateEntries < ActiveRecord::Migration[5.2]
  def change
    create_table :entries do |t|
      t.string :mood
      t.text :photo
      t.text :playlist
      t.text :event
      t.text :poem

      t.timestamps
    end
  end
end
