class AddProfileFieldsToUser < ActiveRecord::Migration[7.1]
  def change
    change_table :users do |t|
      t.string :username
      t.string :first_name
      t.string :last_name
      t.text :bio
      t.string :photo
      t.string :city
      t.string :country
      t.string :phone
      t.date :birthday
    end
  end
end
