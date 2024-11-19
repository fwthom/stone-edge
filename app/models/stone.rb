class Stone < ApplicationRecord
  belongs_to :user
  belongs_to :category
  validates_presence_of :name
  has_many :bookings, dependent: :destroy
end
