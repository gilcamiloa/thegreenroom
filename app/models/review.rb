class Review < ApplicationRecord
  belongs_to :user
  belongs_to :booking
  validates :user, presence: true
  validates :booking, presence: true
  validates :rating, numericality: { only_integer: true }, inclusion: 1..5, presence: true
  validates :content, presence: true
end
