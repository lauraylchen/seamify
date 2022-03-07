class Conversation < ApplicationRecord
  belongs_to :client, class_name: "User"
  belongs_to :seamstress, class_name: "User"
  has_many :messages, dependent: :destroy
end
