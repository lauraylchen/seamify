class CreateConversations < ActiveRecord::Migration[6.1]
  def change
    create_table :conversations do |t|
      t.string :name
      t.references :client, null: false, foreign_key: { to_table: :users }
      t.references :seamstress, null: false, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
