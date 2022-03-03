class RemoveReferenceFromOrderItems < ActiveRecord::Migration[6.1]
  def change
    remove_index :order_items, :seamstress_service_id
    remove_column :order_items, :seamstress_service_id, :bigint
  end
end
