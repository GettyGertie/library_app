class AddBorrowerIdToBooks < ActiveRecord::Migration[5.0]
  def change
    add_column :books, :borrower_id, :integer
  end
end
