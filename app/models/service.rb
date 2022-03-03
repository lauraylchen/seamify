class Service < ApplicationRecord
  belongs_to :seamstress, class_name: "User"
end
