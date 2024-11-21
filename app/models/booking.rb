class Booking < ApplicationRecord
STATUSES = %w[Submitted Confirmed Completed Cancelled]

  belongs_to :stone
  belongs_to :user
end
