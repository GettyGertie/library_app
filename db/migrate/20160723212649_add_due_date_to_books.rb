class AddDueDateToBooks < ActiveRecord::Migration[5.0]
  def change
    add_column :books, :due_date, :datetime, :default => Time.zone.now
  end
end
