class ChatRoom < ApplicationRecord
  has_secure_password
  belongs_to :user
  has_many :messages, dependent: :destroy

end
