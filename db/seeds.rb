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
puts "Création des users"
users = User.create!([
  { email: "thomas@lewagon.org", password: "password", username: "Thomas", bio: "lorem", city: "Lille", country: "France"},
  { email: "camille@lewagon.org", password: "password", username: "Camille", bio: "lorem", city: "Lille", country: "France"},
  { email: "jean@lewagon.org", password: "password", username: "Jean", bio: "lorem", city: "Lille", country: "France"},
  { email: "vincent@lewagon.org", password: "password", username: "Vincent", bio: "lorem", city: "Lille", country: "France"},
])
puts "Users Créés"

puts "Création des catégories"
categories = Category.create!([
  { name: "Pierre magique", properties: "Accorde un vœu, mais uniquement quand il pleut" },
  { name: "Pierre bavarde", properties: "Raconte des blagues, mais seulement en latin" },
  { name: "Pierre chanceuse", properties: "Augmente vos chances aux jeux... sauf au Monopoly" },
  { name: "Pierre gourmande", properties: "Adore les desserts, surtout les tartes aux fraises" },
  { name: "Pierre paresseuse", properties: "Ne bougera jamais, même pour sauver le monde" },
  { name: "Pierre curieuse", properties: "Pose des questions, mais ne veut jamais écouter les réponses" },
  { name: "Pierre romantique", properties: "Tombe amoureuse de toutes les pierres qu'elle croise" },
  { name: "Pierre timide", properties: "Rougit quand on la regarde trop longtemps" },
  { name: "Pierre philosophe", properties: "Pense qu'elle est au centre de l'univers" },
  { name: "Pierre DJ", properties: "Joue de la musique disco dès qu'il y a de la lumière" },
  { name: "Pierre ninja", properties: "Se cache dès qu'on essaie de la trouver" },
  { name: "Pierre à câlins", properties: "Demande des câlins toutes les 10 minutes" },
  { name: "Pierre météo", properties: "Change de couleur selon la température extérieure" },
  { name: "Pierre mystique", properties: "Prévoit votre avenir... ou celui de quelqu’un d’autre" },
  { name: "Pierre blagueuse", properties: "Fait semblant de ne pas être une pierre" }
])
puts "Catégories Créées"
# Création de nouvelles pierres associées aux utilisateurs
puts "Création des stones"
Stone.create!([
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
puts "Stones Créées"


puts "Seed completed: #{User.count} users and #{Stone.count} stones created."
