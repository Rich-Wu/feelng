class AddPlaylistToEntries < ActiveRecord::Migration[5.2]
  def change
    add_column :entries, :playlist, :string
  end
end
