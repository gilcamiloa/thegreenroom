class Venue < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_many_attached :photos
  validates :name, presence: true
  validates :capacity, presence: true
  validates :address, presence: true
  validates :latitude, presence: true
  validates :longitude, presence: true
  validates :description, presence: true
  accepts_nested_attributes_for :bookings
  after_validation :geocode, if: :will_save_change_to_address?
  geocoded_by :address
end
