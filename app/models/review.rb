class Review < ApplicationRecord
  belongs_to :seamstress, class_name: "User"
  belongs_to :client, class_name: "User"
  validates :content, presence: true
  validates :rating, presence: true
end
