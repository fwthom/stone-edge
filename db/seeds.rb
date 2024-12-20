require "open-uri"


# Supprimer les anciens enregistrements
Booking.destroy_all
Stone.destroy_all
User.destroy_all
Category.destroy_all

puts "Création des users"
users = User.create!([
  { email: "thomas@lewagon.org", password: "password", username: "Thomas", bio: "lorem", city: "Lille", country: "France", first_name: "Thomas"},
  { email: "camille@lewagon.org", password: "password", username: "Camille", bio: "lorem", city: "Paris", country: "France", first_name: "Camille"},
  { email: "jean@lewagon.org", password: "password", username: "Jean", bio: "lorem", city: "Marseille", country: "France", first_name: "Jean le Coquinou"},
  { email: "vincent@lewagon.org", password: "password", username: "Vincent", bio: "lorem", city: "Strasbourg", country: "France", first_name: "Vincent"},
])
puts "Users Créés"

puts "Création des catégories"
categories = Category.create!([
  { name: "Pierre magique", properties: "Accorde un vœu, mais uniquement quand il pleut", image_url: "pierre-magique.png" },
  { name: "Pierre bavarde", properties: "Raconte des blagues, mais seulement en latin", image_url: "pierre-bavarde.png" },
  { name: "Pierre gourmande", properties: "Adore les desserts, surtout les tartes aux fraises", image_url: "pierre-gourmande.png" },
  { name: "Pierre romantique", properties: "Tombe amoureuse de toutes les pierres qu'elle croise", image_url: "pierre-romantique.png" },
  { name: "Pierre timide", properties: "Rougit quand on la regarde trop longtemps", image_url: "pierre-timide.png" },
  { name: "Pierre philosophe", properties: "Pense qu'elle est au centre de l'univers", image_url: "pierre-philosophe.png" },
  { name: "Pierre DJ", properties: "Joue de la musique disco dès qu'il y a de la lumière", image_url: "pierre-dj.png" },
  { name: "Pierre ninja", properties: "Se cache dès qu'on essaie de la trouver", image_url: "pierre-ninja.png" },
])

# Array of example image URLs
image_urls = [
  "https://media.cdnws.com/_i/19988/1367/3204/70/agate.jpeg",
  "https://media.cdnws.com/_i/19988/9417/3418/21/aigue-marine-2.jpeg",
  "https://media.cdnws.com/_i/19988/9538/7/38/amazonite-4.jpeg",
  "https://media.cdnws.com/_i/19988/1371/4000/74/ametrine.jpeg",
  "https://media.cdnws.com/_i/19988/9420/3558/24/bois-fossilise-2.jpeg",
  "https://media.cdnws.com/_i/19988/1376/2037/79/calicite-a.jpeg",
  "https://media.cdnws.com/_i/19988/12274/3539/76/jade-nephrite.jpeg",
  "https://media.cdnws.com/_i/19988/12365/1218/68/quartz-rose-aa.jpeg",
  "https://media.cdnws.com/_i/19988/1409/3237/13/zoisite.jpeg",
  "https://media.cdnws.com/_i/19988/9666/1141/67/shungite-1.jpeg",
  "https://media.cdnws.com/_i/19988/12285/2312/87/agate-de-feux.jpeg",
  "https://media.cdnws.com/_i/19988/11493/1738/97/agate-fleur-de-cerisier.jpeg",
  "https://media.cdnws.com/_i/19988/11494/1501/98/agate-indienne.jpeg",
  "https://media.cdnws.com/_i/19988/12289/3419/91/amethyste-bresil.jpeg",
  "https://media.cdnws.com/_i/19988/12271/1962/73/agate-fleur-de-cerisier-verte.jpeg",
  "https://media.cdnws.com/_i/19988/12265/2928/67/apatite-2.jpeg",
  "https://media.cdnws.com/_i/19988/11491/2194/95/corail-fossil.jpeg",
  "https://media.cdnws.com/_i/19988/11489/2576/93/cacedoine-ab.jpeg",
  "https://media.cdnws.com/_i/19988/11488/7/92/grenat-almandin-brut.jpeg",
  "https://media.cdnws.com/_i/19988/11486/432/90/quartz-citron.jpeg",
  "https://media.cdnws.com/_i/19988/12278/1156/80/quartz-fraise-verte.jpeg",
  "https://media.cdnws.com/_i/19988/12262/3189/64/terahertz-1.jpeg",
]

backstories = [
  "J’ai trouvé Maurice au bord de la Loire. Il a bloqué ma roue de vélo, mais depuis, on est inséparables. Il m’aide à caler mes meubles et parfois je lui raconte mes soucis. Il écoute bien, même s'il reste... de marbre.",
  "Elle vient d’une crêperie bretonne où elle tenait la porte arrière. Quand je l’ai adoptée, elle m’a promis de rester discrète. Et elle tient parole : pas un mot depuis 3 ans, mais son aura est apaisante.",
  "Roland a survécu à un barbecue raté où il était supposé tenir la grille. Il en porte encore les traces de charbon, mais il en est fier. On l’appelle maintenant ‘le vétéran’ dans ma bande de potes.",
  "Lucette, polie par des siècles de vagues, est arrivée dans ma vie après un ricochet mémorable. Maintenant, elle refuse de se mouiller et préfère trôner sur mon étagère. Diva, mais adorable.",
  "Je l’ai trouvé bosselé dans mon jardin après une tempête. Basile a peut-être des défauts, mais il est parfait pour caler ma porte les jours de vent. Je lui dis souvent : ‘Tu es mon roc!’",
  "Simone, je l’ai adoptée après une randonnée. Elle n’a pas dit un mot pendant 20 km, mais elle a tenu mon sac comme un pro. Maintenant, elle repose, fière, sur ma cheminée.",
  "Gaston était un caillou de plage jusqu’à ce que je glisse dessus en maillot de bain. Depuis, il s’est excusé et ne bouge plus. Une vraie histoire de pardon et d’amitié.",
  "Pierrot a été abandonné par son ancien propriétaire au bord d’un ruisseau. Il m’a raconté ça en silence le jour où je l’ai ramassé. Maintenant, il fait partie de la famille, toujours un peu mélancolique.",
  "Claudette était la préférée des enfants du parc, jusqu’à ce qu’ils la laissent dans un bac à sable. Quand je l’ai recueillie, elle m’a remercié avec son calme légendaire. Depuis, c’est méditation tous les jours.",
  "Victor a voyagé dans ma poche pendant tout un tour d’Europe. Il ne se plaint jamais, sauf quand il y a trop de sable. Il prétend avoir vu les Alpes, mais bon… il exagère parfois."
]


# Seed data for stones
stones_data = [
  {
    name: "Rubis",
    backstory: "Un joyau d’un autre monde trouvé au fond d’un volcan en colère.",
    daily_price: 150.75,
    personnality_traits: "Impulsif, Passionné, Toujours chaud",
    condition: "Impeccable",
    size: "Petit",
    user: users[0],
    category: categories[0]
  },
  {
    name: "Lapis Lazuli",
    backstory: "Appréciée par les anciens parce qu’ils adoraient les pierres bleu flashy.",
    daily_price: 140.00,
    personnality_traits: "Créatif, Intuitif, Toujours bleu",
    condition: "Impeccable",
    size: "Petit",
    user: users[1],
    category: categories[0]
  },
  {
    name: "Aigue-marine",
    backstory: "Capturant l’essence de la mer, ou au moins de la couleur.",
    daily_price: 140.00,
    personnality_traits: "Calme, Flottant, Rafraîchissant",
    condition: "Éblouissante",
    size: "Grand",
    user: users[2],
    category: categories[0]
  },
  {
    name: "Quartz Rose",
    backstory: "Une pierre romantique qui voit l’amour partout.",
    daily_price: 95.00,
    personnality_traits: "Romantique, Rêveur, Délicat",
    condition: "Charmant",
    size: "Petit",
    user: users[3],
    category: categories[0]
  },

  # Category: Pierre bavarde
  {
    name: "Ambre",
    backstory: "Une résine fossilisée qui sent bon le passé (et un peu l’arbre).",
    daily_price: 95.00,
    personnality_traits: "Chaleureux, Nostalgique, Protecteur (surtout des moustiques emprisonnés).",
    condition: "Bien conservé",
    size: "Petit",
    user: users[0],
    category: categories[1]
  },
  {
    name: "Pierre de Lune",
    backstory: "On dit qu'elle brille sous la lumière de la lune, mais elle fait souvent des caprices.",
    daily_price: 100.00,
    personnality_traits: "Mystérieux, Lunaire, Équilibré (parfois)",
    condition: "Radieuse",
    size: "Moyen",
    user: users[1],
    category: categories[1]
  },
  {
    name: "Obsidienne",
    backstory: "Une pierre volcanique qui aime rappeler qu’elle peut couper comme un couteau.",
    daily_price: 105.00,
    personnality_traits: "Tranchant, Intense, Protecteur",
    condition: "Prêt à l’emploi",
    size: "Petit",
    user: users[2],
    category: categories[1]
  },
  {
    name: "Péridot",
    backstory: "Protège des cauchemars et vous garantit des rêves en technicolor.",
    daily_price: 110.00,
    personnality_traits: "Luminescent, Énergique, Joyeux",
    condition: "Charmant",
    size: "Moyen",
    user: users[3],
    category: categories[1]
  },

  # Category: Pierre gourmande
  {
    name: "Grenat",
    backstory: "Un symbole d’amour et d’amitié éternels… sauf avec les cailloux.",
    daily_price: 80.00,
    personnality_traits: "Fidèle, Romantique, Chaud comme une braise",
    condition: "Éraflé mais charmant",
    size: "Moyen",
    user: users[0],
    category: categories[2]
  },
  {
    name: "Quartz",
    backstory: "La pierre qui amplifie vos intentions, surtout si elles sont un peu floues.",
    daily_price: 90.00,
    personnality_traits: "Polyvalent, Zen, Un peu vague",
    condition: "Correct",
    size: "Grand",
    user: users[1],
    category: categories[2]
  },
  {
    name: "Topaze",
    backstory: "Elle adore clarifier les choses… sauf pourquoi elle est si chère.",
    daily_price: 120.00,
    personnality_traits: "Concentré, Calme, Clair comme de l’eau de roche",
    condition: "Bon état",
    size: "Grand",
    user: users[2],
    category: categories[2]
  },
  {
    name: "Zircon",
    backstory: "Prospérité garantie (si vous aimez les promesses marketing).",
    daily_price: 135.00,
    personnality_traits: "Sage, Solide, Inspirant",
    condition: "Poli",
    size: "Grand",
    user: users[3],
    category: categories[2]
  },

  # Category: Pierre romantique
  {
    name: "Améthyste",
    backstory: "Une pierre zen qui croit qu’un bain de soleil suffit contre les énergies négatives.",
    daily_price: 110.00,
    personnality_traits: "Calme, Mystique, Classe",
    condition: "Brillant",
    size: "Grand",
    user: users[0],
    category: categories[3]
  },
  {
    name: "Émeraude",
    backstory: "Un secret de la nature (même si tout le monde sait qu’elle est verte).",
    daily_price: 200.00,
    personnality_traits: "Guérisseur, Rafraîchissant, Majestueux",
    condition: "Éclatant",
    size: "Grand",
    user: users[1],
    category: categories[3]
  },
  {
    name: "Citrine",
    backstory: "Cette pierre adore attirer la richesse… mais surtout dans les légendes.",
    daily_price: 85.00,
    personnality_traits: "Enjoué, Riche (de personnalité), Chaleureux",
    condition: "Bien préservé",
    size: "Petit",
    user: users[2],
    category: categories[3]
  },
  {
    name: "Alexandrite",
    backstory: "Une pierre rare qui change de couleur selon son humeur (et la lumière).",
    daily_price: 220.00,
    personnality_traits: "Caméléon, Unique, Surprenant",
    condition: "Hypnotisant",
    size: "Petit",
    user: users[3],
    category: categories[3]
  },
  # Category: Pierre timide
  {
    name: "Quartz Furtif",
    backstory: "Ce quartz se cache derrière les autres pierres quand on le regarde.",
    daily_price: 90.00,
    personnality_traits: "Discret, Timide, Solitaire",
    condition: "Impeccable",
    size: "Petit",
    user: users[0],
    category: categories[4]
  },
  {
    name: "Onyx Timide",
    backstory: "Une pierre noire qui rougit dès qu’on la complimente.",
    daily_price: 80.00,
    personnality_traits: "Introverti, Mystérieux, Fragile",
    condition: "Correct",
    size: "Petit",
    user: users[1],
    category: categories[4]
  },
  {
    name: "Pierre Cachée",
    backstory: "Elle adore se camoufler, même quand personne ne la cherche.",
    daily_price: 70.00,
    personnality_traits: "Invisible, Silencieuse, Indépendante",
    condition: "Bien conservé",
    size: "Moyen",
    user: users[2],
    category: categories[4]
  },
  {
    name: "Cristal Mystère",
    backstory: "Un cristal qui adore jouer à cache-cache.",
    daily_price: 100.00,
    personnality_traits: "Joueur, Réservé, Curieux",
    condition: "Éclatant",
    size: "Petit",
    user: users[3],
    category: categories[4]
  },

  # Category: Pierre philosophe
  {
    name: "Saphir Sceptique",
    backstory: "Il passe son temps à se demander si les pierres pensent.",
    daily_price: 120.00,
    personnality_traits: "Intellectuel, Mystique, Rêveur",
    condition: "Impeccable",
    size: "Petit",
    user: users[0],
    category: categories[5]
  },
  {
    name: "Granite Pensif",
    backstory: "Un bloc de granite qui pense qu’il est au centre de l’univers.",
    daily_price: 60.00,
    personnality_traits: "Sage, Arrogant, Solitaire",
    condition: "Correct",
    size: "Grand",
    user: users[1],
    category: categories[5]
  },
  {
    name: "Marbre Morose",
    backstory: "Toujours en train de méditer sur le sens de la vie.",
    daily_price: 85.00,
    personnality_traits: "Profond, Silencieux, Sérieux",
    condition: "Bien poli",
    size: "Moyen",
    user: users[2],
    category: categories[5]
  },
  {
    name: "Agate Penseur",
    backstory: "Une pierre qui écrit des poèmes dans son temps libre.",
    daily_price: 75.00,
    personnality_traits: "Poétique, Rêveur, Créatif",
    condition: "Impeccable",
    size: "Petit",
    user: users[3],
    category: categories[5]
  },

  # Category: Pierre DJ
  {
    name: "Cristal Disco",
    backstory: "Brille de mille feux dès qu’il entend de la musique.",
    daily_price: 110.00,
    personnality_traits: "Festif, Lumineux, Dynamique",
    condition: "Impeccable",
    size: "Petit",
    user: users[0],
    category: categories[6]
  },
  {
    name: "Quartz Rythmeur",
    backstory: "Ne peut s’empêcher de danser sous les rayons du soleil.",
    daily_price: 95.00,
    personnality_traits: "Danseur, Energique, Joyeux",
    condition: "Radieux",
    size: "Petit",
    user: users[1],
    category: categories[6]
  },
  {
    name: "Pierre Lumière",
    backstory: "Adore les fêtes et les projecteurs.",
    daily_price: 120.00,
    personnality_traits: "Charismatique, Extraverti, Lumineux",
    condition: "Brillant",
    size: "Moyen",
    user: users[2],
    category: categories[6]
  },
  {
    name: "Spinelle Ambiance",
    backstory: "Une pierre qui met le feu à la piste de danse.",
    daily_price: 130.00,
    personnality_traits: "Festif, Audacieux, Éclatant",
    condition: "Impeccable",
    size: "Petit",
    user: users[3],
    category: categories[6]
  },

  # Category: Pierre ninja
  {
    name: "Obsidienne Furtive",
    backstory: "Disparaît dès que quelqu’un entre dans la pièce.",
    daily_price: 105.00,
    personnality_traits: "Silencieuse, Agile, Sombre",
    condition: "Bien conservée",
    size: "Petit",
    user: users[0],
    category: categories[7]
  },
  {
    name: "Granite Camouflé",
    backstory: "Se fond dans le décor sans faire un bruit.",
    daily_price: 80.00,
    personnality_traits: "Indétectable, Calme, Réfléchi",
    condition: "Correct",
    size: "Grand",
    user: users[1],
    category: categories[7]
  },
  {
    name: "Saphir Secret",
    backstory: "Une pierre qui ne dévoile jamais ses secrets.",
    daily_price: 120.00,
    personnality_traits: "Mystérieuse, Agile, Solitaire",
    condition: "Impeccable",
    size: "Petit",
    user: users[2],
    category: categories[7]
  },
  {
    name: "Jade Fantôme",
    backstory: "Elle se cache dans les ombres et surgit sans prévenir.",
    daily_price: 95.00,
    personnality_traits: "Discrète, Agile, Mystique",
    condition: "Éclatant",
    size: "Moyen",
    user: users[3],
    category: categories[7]
  }
  # Add more stones as needed...
]

# Iterate over stones_data to create records and attach random images
stones_data.each do |stone_data|
  # Create the stone record
  stone = Stone.create!(
    name: stone_data[:name],
    backstory: backstories.sample,
    daily_price: stone_data[:daily_price],
    personnality_traits: stone_data[:personnality_traits],
    condition: stone_data[:condition],
    size: stone_data[:size],
    user: stone_data[:user],
    category: stone_data[:category]
  )
  random_image_url = image_urls.sample

  file = URI.open(random_image_url)
  stone.photo.attach(io: file, filename: "#{stone.name.downcase.gsub(' ', '_')}.jpg", content_type: "image/jpeg")

  puts "Created stone '#{stone.name}' with a random image"
end

puts "Seeding completed!"
