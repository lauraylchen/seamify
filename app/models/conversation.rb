class Conversation < ApplicationRecord
  belongs_to :client
  belongs_to :seamstress
end
