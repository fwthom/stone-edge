require 'open-uri'

def attach_photo(stone, public_id)
  stone.photo.attach(
    io: URI.open(Cloudinary::Utils.cloudinary_url(public_id)),
    filename: "#{public_id.split('/').last}.jpg", # Generate a filename from the public_id
    content_type: "image/jpeg"
  )
end

# Supprimer les anciens enregistrements
Stone.destroy_all
User.destroy_all
Category.destroy_all

# Création de nouveaux utilisateurs
puts "Création des users"
users = User.create!([
  { email: "thomas@lewagon.org", password: "password", username: "Thomas", bio: "lorem", city: "Lille", country: "France"},
  { email: "camille@lewagon.org", password: "password", username: "Camille", bio: "lorem", city: "Paris", country: "France"},
  { email: "jean@lewagon.org", password: "password", username: "Jean", bio: "lorem", city: "Marseille", country: "France"},
  { email: "vincent@lewagon.org", password: "password", username: "Vincent", bio: "lorem", city: "Strasbourg", country: "France"},
])
puts "Users Créés"

puts "Création des catégories"
categories = Category.create!([
  { name: "Pierre magique", properties: "Accorde un vœu, mais uniquement quand il pleut", photo_url: "pierre-magique.png" },
  { name: "Pierre bavarde", properties: "Raconte des blagues, mais seulement en latin", photo_url: "pierre-bavarde.png" },
  { name: "Pierre gourmande", properties: "Adore les desserts, surtout les tartes aux fraises", photo_url: "pierre-gourmande.png" },
  { name: "Pierre romantique", properties: "Tombe amoureuse de toutes les pierres qu'elle croise", photo_url: "pierre-romantique.png" },
  { name: "Pierre timide", properties: "Rougit quand on la regarde trop longtemps", photo_url: "pierre-timide.png" },
  { name: "Pierre philosophe", properties: "Pense qu'elle est au centre de l'univers", photo_url: "pierre-philosophe.png" },
  { name: "Pierre DJ", properties: "Joue de la musique disco dès qu'il y a de la lumière", photo_url: "pierre-dj.png" },
  { name: "Pierre ninja", properties: "Se cache dès qu'on essaie de la trouver", photo_url: "pierre-ninja.png" },
])
puts "Catégories Créées"
# Création de nouvelles pierres associées aux utilisateurs
puts "Création des stones"
DEFAULT_IMAGE_URL = Cloudinary::Utils.cloudinary_url("development/17n6kwpi22xr4dlapk6w6t56qudu")
stones = Stone.create!([
  {
    name: "Ruby",
    backstory: "Another-worldly gem found in the depths of a volcano.",
    daily_price: 150.75,
    personnality_traits: "Fiery, Passionate, Bold",
    condition: "Pristine",
    size: "Small",
    user: users[0],
    category: categories.sample
  },
  {
    name: "Amber",
    backstory: "An ancient fossilized resin said to contain the essence of life.",
    daily_price: 95.00,
    personnality_traits: "Warm, Nostalgic, Protective",
    condition: "Good",
    size: "Small",
    user: users[0],
    category: categories.sample
  },
  {
    name: "Garnet",
    backstory: "A gem symbolizing love and eternal friendship.",
    daily_price: 80.00,
    personnality_traits: "Loyal, Passionate, Warm",
    condition: "Fair",
    size: "Medium",
    user: users[0],
    category: categories.sample
  },
  {
    name: "Amethyst",
    backstory: "A calming stone believed to protect against negativity.",
    daily_price: 110.00,
    personnality_traits: "Serene, Protective, Elegant",
    condition: "Excellent",
    size: "Large",
    user: users[0],
    category: categories.sample
  },
  {
    name: "Sapphire",
    backstory: "Known as the wisdom stone, discovered in ancient ruins.",
    daily_price: 120.50,
    personnality_traits: "Calm, Wise, Protective",
    condition: "Good",
    size: "Medium",
    user: users[1],
    category: categories.sample
  },
  {
    name: "Lapis Lazuli",
    backstory: "A stone prized by ancient civilizations for its deep blue hue.",
    daily_price: 140.00,
    personnality_traits: "Creative, Intuitive, Spiritual",
    condition: "Pristine",
    size: "Small",
    user: users[1],
    category: categories.sample
  },
  {
    name: "Moonstone",
    backstory: "Said to bring balance and harmony under the moonlight.",
    daily_price: 100.00,
    personnality_traits: "Mysterious, Harmonious, Reflective",
    condition: "Excellent",
    size: "Medium",
    user: users[1],
    category: categories.sample
  },
  {
    name: "Quartz",
    backstory: "A versatile stone believed to amplify energy and intentions.",
    daily_price: 90.00,
    personnality_traits: "Versatile, Balanced, Amplifying",
    condition: "Good",
    size: "Large",
    user: users[1],
    category: categories.sample
  },
  {
    name: "Emerald",
    backstory: "A gem said to hold the secrets of nature’s balance.",
    daily_price: 200.00,
    personnality_traits: "Healing, Refreshing, Regal",
    condition: "Excellent",
    size: "Large",
    user: users[2],
    category: categories.sample
  },
  {
    name: "Onyx",
    backstory: "A dark and mysterious stone believed to ward off negativity.",
    daily_price: 110.00,
    personnality_traits: "Mysterious, Grounded, Strong",
    condition: "Good",
    size: "Medium",
    user: users[2],
    category: categories.sample
  },
  {
    name: "Obsidian",
    backstory: "Formed from volcanic glass, known for its cutting edge.",
    daily_price: 105.00,
    personnality_traits: "Sharp, Intense, Protective",
    condition: "Pristine",
    size: "Small",
    user: users[2],
    category: categories.sample
  },
  {
    name: "Turquoise",
    backstory: "Believed to bring good fortune and strength.",
    daily_price: 130.00,
    personnality_traits: "Balanced, Positive, Inspiring",
    condition: "Excellent",
    size: "Medium",
    user: users[2],
    category: categories.sample
  },
  {
    name: "Topaz",
    backstory: "A gem of clarity and focus, valued by scholars.",
    daily_price: 120.00,
    personnality_traits: "Focused, Calm, Clear",
    condition: "Good",
    size: "Large",
    user: users[3],
    category: categories.sample
  },
  {
    name: "Citrine",
    backstory: "A warm and sunny stone said to attract wealth.",
    daily_price: 85.00,
    personnality_traits: "Cheerful, Abundant, Warm",
    condition: "Good",
    size: "Small",
    user: users[3],
    category: categories.sample
  },
  {
    name: "Diamond",
    backstory: "The ultimate symbol of strength and beauty.",
    daily_price: 250.00,
    personnality_traits: "Strong, Beautiful, Radiant",
    condition: "Pristine",
    size: "Small",
    user: users[3],
    category: categories.sample
  },
  {
    name: "Aquamarine",
    backstory: "A gem that captures the essence of the sea.",
    daily_price: 140.00,
    personnality_traits: "Calm, Flowing, Refreshing",
    condition: "Excellent",
    size: "Large",
    user: users[3],
    category: categories.sample
  }
]).each do |stone|
  attach_photo(stone, "development/17n6kwpi22xr4dlapk6w6t56qudu")
end


puts "Seed completed: #{User.count} users and #{Stone.count} stones created."
