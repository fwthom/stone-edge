class Booking < ApplicationRecord
STATUSES = %w[Pending Planned Completed Canceled]

  belongs_to :stone
  belongs_to :user
end
