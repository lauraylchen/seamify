class AddReferenceToOrderItems < ActiveRecord::Migration[6.1]
  def change
    add_reference :order_items, :service, null: false, foreign_key: true
  end
end
