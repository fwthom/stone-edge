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
    image_url: "https://images.unsplash.com/photo-1551122102-63cd339bfaab?q=80&w=2071&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
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
    image_url: "https://images.unsplash.com/photo-1613843351058-1dd06fda7c02?q=80&w=1974&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
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
    image_url: "https://images.unsplash.com/photo-1600119612651-0db31b3a7baa?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
    user: users.third,
    category: categories.first

  }
])

puts "Seed completed: #{User.count} users and #{Stone.count} stones created."
