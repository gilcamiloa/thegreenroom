class Chatroom < ApplicationRecord
  belongs_to :venue
  belongs_to :user
  validates :user, presence: true
  validates :venue, presence: true
  validates :name, presence: true
end
