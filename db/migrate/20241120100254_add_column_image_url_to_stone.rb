class AddColumnImageUrlToStone < ActiveRecord::Migration[7.1]
  def change
    add_column :stones, :image_url, :string
  end
end
