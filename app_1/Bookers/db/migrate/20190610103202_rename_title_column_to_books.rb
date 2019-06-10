class RenameTitleColumnToBooks < ActiveRecord::Migration[5.2]
  def change
  	rename_column :books, :Title, :title
  	rename_column :books, :Body, :body
  end
end
