class AddCoordinatesToStones < ActiveRecord::Migration[7.1]
  def change
    add_column :stones, :latitude, :float
    add_column :stones, :longitude, :float
  end
end
