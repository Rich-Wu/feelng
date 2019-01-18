class RemoveSongFromEntries < ActiveRecord::Migration[5.2]
  def change
    remove_column :entries, :song, :string
  end
end
