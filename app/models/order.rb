class Order < ApplicationRecord
  belongs_to :client, class_name: "User"
  belongs_to :seamstress, class_name: "User"
  has_many :order_items, dependent: :destroy
  accepts_nested_attributes_for :order_items
end
