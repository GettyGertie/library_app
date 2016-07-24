class AddSurchargeToBooks < ActiveRecord::Migration[5.0]
  def change
    add_column :books, :surcharge, :integer, default: 0
  end
end
