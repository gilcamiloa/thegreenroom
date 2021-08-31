class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :bookings, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :venues, dependent: :destroy
  has_many :messages, dependent: :destroy
  has_many :chatrooms, dependent: :destroy
  has_many :tours, dependent: :destroy
  validates :is_band, type: boolean, presence: true
  validates :username, presence: true
  validates :band_name, presence: true
  validates :band_description, presence: true
end
