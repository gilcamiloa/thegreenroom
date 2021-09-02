class Tour < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  validates :name, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true
  # geocoded_by :address
  # after_validation :geocode, if: :will_save_change_to_address?
  has_many :venues, through: :bookings
end
