class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :orders_as_client, class_name: "Order", foreign_key: :client_id
  has_many :orders_as_seamstress, class_name: "Order", foreign_key: :seamstress_id
  has_many :services, class_name: "Service", foreign_key: :seamstress_id

  has_many :messages_as_sender, class_name: "Message", foreign_key: :sender_id
  has_many :messages_as_receiver, class_name: "Message", foreign_key: :receiver_id
  has_many :chatrooms_as_sender, through: :messages_as_sender
  has_many :chatrooms_as_receiver, through: :messages_as_receiver

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  has_one_attached :photo
end
