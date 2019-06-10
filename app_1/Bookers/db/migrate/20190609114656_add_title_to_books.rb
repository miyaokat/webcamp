class AddTitleToBooks < ActiveRecord::Migration[5.2]
  def change
    add_column :books, :Title, :string
  end
end
