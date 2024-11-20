class DropProfilesTable < ActiveRecord::Migration[7.1]
  def up
    drop_table :profiles
  end

  def down
    create_table :profiles do |t|
      t.string :username
      t.string :first_name
      t.string :last_name
      t.text :bio
      t.string :photo
      t.string :city
      t.string :country
      t.string :email
      t.string :phone
      t.string :website
      t.integer :age
      t.string :gender
      t.date :birthday
      t.bigint :user_id, null: false
      t.datetime :created_at, null: false
      t.datetime :updated_at, null: false
      t.index :user_id

      # Add foreign key for the user association
      t.foreign_key :users
    end
  end
end
