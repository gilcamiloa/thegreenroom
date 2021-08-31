class Message < ApplicationRecord
  belongs_to :chatroom
  belongs_to :user
  validates :date, presence: true
  validates :content, presence: true
end
