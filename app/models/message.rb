class Message < ApplicationRecord
  belongs_to :chatroom
  belongs_to :sender, class_name: "User"
  belongs_to :receiver, class_name: "User"
end
