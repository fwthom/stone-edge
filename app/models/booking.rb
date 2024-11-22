class Booking < ApplicationRecord

STATUSES = %w[Submitted Accepted Share Home]




  belongs_to :stone
  belongs_to :user
end
