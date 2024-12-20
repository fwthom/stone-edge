class User < ApplicationRecord
  has_many :stones
  has_many :bookings

  has_one_attached :avatar


  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
