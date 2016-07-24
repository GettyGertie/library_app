class AddQuantityToBooks < ActiveRecord::Migration[5.0]
  def change
    add_column :books, :quantity, :integer
  end
end
