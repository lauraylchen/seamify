class CreateSeamstressServices < ActiveRecord::Migration[6.1]
  def change
    create_table :seamstress_services do |t|
      t.references :service, null: false, foreign_key: true
      t.references :seamstress, null: false, foreign_key: { to_table: :users }
      t.float :price
      t.float :estimated_time

      t.timestamps
    end
  end
end
