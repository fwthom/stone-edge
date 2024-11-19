class User < ApplicationRecord
  has_many :stones

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

end
