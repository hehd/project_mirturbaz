class CreateCamps < ActiveRecord::Migration[6.0]
  def change
    create_table :camps do |t|
      t.string :name
      t.integer :price
      t.timestamps
    end
    add_index :camps, :name
    add_index :camps, :price
  end
end
