class Stone < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_one_attached :photo
  validates_presence_of :name
  has_many :bookings, dependent: :destroy
end
