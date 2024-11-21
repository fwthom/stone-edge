class User < ApplicationRecord
  has_many :stones
  has_many :bookings

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

end
