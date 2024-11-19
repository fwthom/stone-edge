# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
#
#
# Supprimer les anciens enregistrements
Stone.destroy_all
User.destroy_all
Category.destroy_all

# Création de nouveaux utilisateurs
users = User.create!([
  { email: "thomas@lewagon.org", password: "password" },
  { email: "camille@lewagon.org", password: "password" },
  { email: "jean@lewagon.org", password: "password" },
  { email: "vincent@lewagon.org", password: "password" }
])

categories = Category.create!([
  name:"Pierre idiote",
  properties: "Cette pierre rend + bête"
])
# Création de nouvelles pierres associées aux utilisateurs
stones = Stone.create!([
  {
    name: "Ruby",
    backstory: "Another-worldly gem found in the depths of a volcano.",
    daily_price: 150.75,
    personnality_traits: "Fiery, Passionate, Bold",
    condition: "Pristine",
    size: "Small",
    user: users.first,
    category: categories.first
  },
  {
    name: "Sapphire",
    backstory: "Known as the wisdom stone, discovered in ancient ruins.",
    daily_price: 120.50,
    personnality_traits: "Calm, Wise, Protective",
    condition: "Good",
    size: "Medium",
    user: users.second,
    category: categories.first

  },
  {
    name: "Emerald",
    backstory: "A gem said to hold the secrets of nature’s balance.",
    daily_price: 200.00,
    personnality_traits: "Healing, Refreshing, Regal",
    condition: "Excellent",
    size: "Large",
    user: users.third,
    category: categories.first

  }
])

puts "Seed completed: #{User.count} users and #{Stone.count} stones created."
