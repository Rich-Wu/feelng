class RemoveColorFromEntries < ActiveRecord::Migration[5.2]
  def change
    remove_column :entries, :color, :string
  end
end
