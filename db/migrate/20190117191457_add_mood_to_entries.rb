class AddMoodToEntries < ActiveRecord::Migration[5.2]
  def change
    add_column :entries, :mood, :string
  end
end
