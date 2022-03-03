class AddBooleanToOrders < ActiveRecord::Migration[6.1]
  def change
    add_column :orders, :confirmed, :boolean, default: false
  end
end
