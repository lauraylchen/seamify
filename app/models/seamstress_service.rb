class SeamstressService < ApplicationRecord
  belongs_to :service
  belongs_to :seamstress, class_name: "User"
end
