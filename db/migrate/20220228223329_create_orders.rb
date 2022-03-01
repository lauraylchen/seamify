class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.references :client, null: false, foreign_key: { to_table: :users }
      t.datetime :drop_time

      t.timestamps
    end
  end
end
