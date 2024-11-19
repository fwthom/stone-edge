class Booking < ApplicationRecord
# STATUSES = %w[Planned Completed Canceled]

  belongs_to :stone
  belongs_to :user
end
