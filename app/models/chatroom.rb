class Chatroom < ApplicationRecord
  belongs_to :venue
  belongs_to :user
  validates :user, prescence: true
  validates :venue, prescence: true
  validates :name, prescence: true
end
