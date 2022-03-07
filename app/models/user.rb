class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :orders_as_client, class_name: "Order", foreign_key: :client_id, dependent: :destroy
  has_many :orders_as_seamstress, class_name: "Order", foreign_key: :seamstress_id, dependent: :destroy
  has_many :services, class_name: "Service", foreign_key: :seamstress_id, dependent: :destroy

  has_many :conversations_as_client, class_name: "Conversation", foreign_key: :client_id, dependent: :destroy
  has_many :conversations_as_seamstress, class_name: "Conversation", foreign_key: :seamstress_id, dependent: :destroy
  has_many :messages, class_name: "Message", foreign_key: :sender_id, dependent: :destroy

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  has_one_attached :photo
end
