class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :bookings, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :venues, dependent: :destroy
  has_many :bookings, through: :venues
  has_many :messages, dependent: :destroy
  has_many :chatrooms, dependent: :destroy
  has_many :tours, dependent: :destroy
  has_one_attached :photo
end
