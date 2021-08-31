class Message < ApplicationRecord
  belongs_to :chatroom
  belongs_to :user
  validate :date, presence: true
  validate :content, presence: true
end
