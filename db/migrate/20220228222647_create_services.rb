class CreateServices < ActiveRecord::Migration[6.1]
  def change
    create_table :services do |t|
      t.string :name
      t.string :clothing
      t.string :repair
      t.string :material
      t.text :description

      t.timestamps
    end
  end
end
