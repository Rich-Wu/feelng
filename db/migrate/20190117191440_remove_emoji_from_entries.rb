class RemoveEmojiFromEntries < ActiveRecord::Migration[5.2]
  def change
    remove_column :entries, :emoji, :string
  end
end
