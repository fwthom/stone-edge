class Stone < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_one_attached :photo
  validates_presence_of :name
  has_many :bookings, dependent: :destroy

  geocoded_by ->(obj) { "#{obj.user.city}, #{obj.user.country}" }
  after_validation :geocode, if: :user_location_change?

  private

  # Vérifie si la ville ou le pays de l'utilisateur ont changé
  def user_location_changed?
    user&.saved_change_to_city? || user&.saved_change_to_country?
  end
end
