class AddWhereaboutsToBooks < ActiveRecord::Migration[5.0]
  def change
    add_column :books, :whereabouts, :integer, default: 0
  end
end
