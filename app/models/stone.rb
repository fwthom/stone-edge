class Stone < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_one_attached :photo
  validates_presence_of :name
  has_many :bookings, dependent: :destroy

  include PgSearch::Model
  pg_search_scope :search_by_name_backstory_personnality,
  against: [ :name, :backstory, :personnality_traits ],
  associated_against: {
    category: [:name],
  },
  using: {
    tsearch: { prefix: true } 
  }




  geocoded_by :address
  before_create :geocode

  private

  def address
    "#{user.city}, #{user.country}"
  end


end
