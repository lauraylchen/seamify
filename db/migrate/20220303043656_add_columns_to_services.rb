class AddColumnsToServices < ActiveRecord::Migration[6.1]
  def change
    add_column :services, :price, :float
    add_column :services, :estimated_time, :float
    add_reference :services, :seamstress, null: false, foreign_key: { to_table: :users }
  end
end
