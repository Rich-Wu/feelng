class RemoveUserIdFromJournals < ActiveRecord::Migration[5.2]
  def change
    remove_column :journals, :user_id, :string
  end
end
