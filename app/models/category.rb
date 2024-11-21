class Category < ApplicationRecord
  has_many :stones
  include PgSearch::Model
  multisearchable against: [:name, :properties]
end
