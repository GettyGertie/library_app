class CreateBooks < ActiveRecord::Migration[5.0]
  def change
    create_table :books do |t|
      t.string :title
      t.string :author
      t.string :description
      t.references :user, index: true
      t.timestamps null: false
    end
    add_foreign_key :books, :users

    add_index :books, [:user_id, :created_at]
  end
end
