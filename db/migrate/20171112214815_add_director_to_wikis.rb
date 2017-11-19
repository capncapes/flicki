class AddDirectorToWikis < ActiveRecord::Migration[5.1]
  def change
    add_column :wikis, :director, :string
    add_column :wikis, :year, :integer
  end
end
