class CreateEntries < ActiveRecord::Migration[5.2]
  def change
    create_table :entries do |t|
      t.string :emoji
      t.string :color
      t.string :song
      t.integer :journal_id
      t.string :event
      t.string :content
      t.string :poem

      t.timestamps
    end
  end
end
