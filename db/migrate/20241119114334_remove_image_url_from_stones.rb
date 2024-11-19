class RemoveImageUrlFromStones < ActiveRecord::Migration[7.1]
  def change
    remove_column :stones, :image_url
  end
end
