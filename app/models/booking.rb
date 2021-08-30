class Booking < ApplicationRecord
  belongs_to :venue
  belongs_to :user
  belongs_to :tour, optional: true
end
