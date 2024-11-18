class CreateStones < ActiveRecord::Migration[7.1]
  def change
    create_table :stones do |t|
      t.string :name
      t.text :backstory
      t.decimal :daily_price
      t.string :personnality_traits
      t.string :condition
      t.string :size
      t.string :image_url
      t.references :user, null: false, foreign_key: true
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
