class AddBookstatusToBooks < ActiveRecord::Migration[5.0]
  def change
    add_column :books, :bookstatus, :integer, default: 0
  end
end
