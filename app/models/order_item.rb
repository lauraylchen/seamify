class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :seamstress_service
end
