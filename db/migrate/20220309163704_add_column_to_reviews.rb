class AddColumnToReviews < ActiveRecord::Migration[6.1]
  def change
    add_column :reviews, :service, :string
  end
end
