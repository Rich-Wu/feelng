class AddPhotoToEntry < ActiveRecord::Migration[5.2]
  def change
    add_column :entries, :photo, :string
  end
end
