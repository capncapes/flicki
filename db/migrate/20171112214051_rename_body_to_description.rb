class RenameBodyToDescription < ActiveRecord::Migration[5.1]
  def change
    rename_column :wikis, :body, :description
  end
end
