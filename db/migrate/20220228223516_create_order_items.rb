class CreateOrderItems < ActiveRecord::Migration[6.1]
  def change
    create_table :order_items do |t|
      t.references :order, null: false, foreign_key: true
      t.references :seamstress_service, null: false, foreign_key: true

      t.timestamps
    end
  end
end
