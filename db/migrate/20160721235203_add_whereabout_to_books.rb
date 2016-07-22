class AddWhereaboutToBooks < ActiveRecord::Migration[5.0]
  def change
    add_column :books, :whereabout, :integer, default: 0
  end
end
