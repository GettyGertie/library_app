class AddLendTimeToBooks < ActiveRecord::Migration[5.0]
  def change
    add_column :books, :lend_time, :datetime
  end
end
