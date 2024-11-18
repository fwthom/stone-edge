class Booking < ApplicationRecord
  belongs_to :stone
  belongs_to :user
end
