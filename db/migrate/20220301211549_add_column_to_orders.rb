class AddColumnToOrders < ActiveRecord::Migration[6.1]
  def change
    add_reference :orders, :seamstress, null: false, foreign_key: { to_table: :users }
  end
end
