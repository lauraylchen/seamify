class Review < ApplicationRecord
  belongs_to :seamstress, class_name: "User"
  belongs_to :client, class_name: "User"
end
