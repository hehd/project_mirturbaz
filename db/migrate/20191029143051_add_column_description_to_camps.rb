class AddColumnDescriptionToCamps < ActiveRecord::Migration[6.0]
  def change
    add_column :camps, :description, :string
  end
end
