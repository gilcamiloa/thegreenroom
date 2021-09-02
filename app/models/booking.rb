class Booking < ApplicationRecord
  belongs_to :venue
  belongs_to :user
  belongs_to :tour, optional: true
  validates :venue, presence: true
  validates :user, presence: true
  validates :dates, presence: true
end
