require 'active_record'
require 'ffaker'
require 'pokemon_faker'
require 'pg'
require_relative 'connection'
require_relative '../models/pokemon'
require_relative '../models/trainer'
require_relative '../models/team'

team_array = []

mystic = Team.create(name: "Mystic", img_url: "https://heavyeditorial.files.wordpress.com/2016/07/team-mystic-decal.jpg?quality=65&strip=all&w=780&strip=all")
team_array.push(mystic)

valor = Team.create(name: "Valor", img_url: "https://heavyeditorial.files.wordpress.com/2016/07/team-valor-logo.jpg?quality=65&strip=all&w=780")
team_array.push(valor)

instinct = Team.create(name: "Instinct", img_url: "https://cdn.shopify.com/s/files/1/0715/4345/products/team-instinct-cutout_145e1356-5d14-4e48-8a01-d62a7e2d2509_1024x1024.jpg?v=1492804894")
team_array.push(instinct)

girl_photos = ["https://vignette3.wikia.nocookie.net/nintendo/images/e/e0/Wallace_%28Pok%C3%A9mon_Emerald%29.png/revision/latest?cb=20111017140953&path-prefix=en", "https://vignette1.wikia.nocookie.net/nintendo/images/2/22/Elesa_%28Pok%C3%A9mon_Black_and_White%29.png/revision/latest?cb=20111016111857&path-prefix=en", "https://vignette4.wikia.nocookie.net/nintendo/images/8/8e/Dawn.png/revision/latest?cb=20100904171851&path-prefix=en", "https://vignette4.wikia.nocookie.net/nintendo/images/0/01/Roxie_%28Pok%C3%A9mon_Black_2_and_White_2%29.png/revision/latest?cb=20130827142511&path-prefix=en"]
boy_photos = ["https://vignette3.wikia.nocookie.net/nintendo/images/e/e7/Bruno.png/revision/latest?cb=20120523033952&path-prefix=en", "https://vignette4.wikia.nocookie.net/nintendo/images/8/86/DPP_Flint.png/revision/latest?cb=20161007171330&path-prefix=en", "https://vignette1.wikia.nocookie.net/nintendo/images/3/30/Pryce.png/revision/latest?cb=20110105194038&path-prefix=en", "https://vignette3.wikia.nocookie.net/nintendo/images/8/87/Volkner.png/revision/latest?cb=20111017133308&path-prefix=en"]

girl_photos.shuffle!
boy_photos.shuffle!

girl_info = []
boy_info = []
all_trainers = []

for i in 0...girl_photos.length
  array = [FFaker::Name.first_name_female, girl_photos[i]]
  girl_info.push(array)
end

for i in 0...boy_photos.length
  array = [FFaker::Name.first_name_male, boy_photos[i]]
  boy_info.push(array)
end

Trainer.destroy_all

for i in 0...girl_info.length
  n = Trainer.create(name: girl_info[i][0], img_url: girl_info[i][1], spunk: rand(100), team: team_array[rand(0...team_array.length)])
  all_trainers.push(n)
end

for i in 0...boy_info.length
  n = Trainer.create(name: boy_info[i][0], img_url: boy_info[i][1], spunk: rand(100), team: team_array[rand(0...team_array.length)])
  all_trainers.push(n)
end

Pokemon.destroy_all

pokemon_info = []
pokemon_types = ["fun", "silly", "dumb", "quizzicle", "energetic", "sleepy", "sneezy", "dopey", "sad", "happy", "grumpy"]

20.times do
  pokemon_info.push(PokemonFaker.match)
end

pokemon_info.shuffle!

pokemon_info.each do |pokemon|
  Pokemon.create(name: pokemon[0], cp: rand(800), poke_type: pokemon_types[rand(0...pokemon_types.length)], img_url: pokemon[1], trainer: all_trainers[rand(0...all_trainers.length)])
end

# Pokemon.create(name: "Charmander", cp: rand(800), poke_type: "fire", img_url: "https://img.pokemondb.net/artwork/charmander.jpg", trainer: boy1)
# Pokemon.create(name: "Squirtle", cp: rand(800), poke_type: "water", img_url: "https://img.pokemondb.net/artwork/squirtle.jpg", trainer: girl1)
# Pokemon.create(name: "Pikachu", cp: rand(800), poke_type: "lightning", img_url: "https://img.pokemondb.net/artwork/pikachu.jpg", trainer: boy2)
# Pokemon.create(name: "Bulbasaur", cp: rand(800), poke_type: "grass", img_url: "https://img.pokemondb.net/artwork/bulbasaur.jpg", trainer: girl2)
# Pokemon.create(name: "Clefairy", cp: rand(800), poke_type: "fairy", img_url: "https://img.pokemondb.net/artwork/clefairy.jpg", trainer: boy3)
# Pokemon.create(name: "Nidoking", cp: rand(800), poke_type: "poison ground", img_url: "https://img.pokemondb.net/artwork/nidoking.jpg", trainer: girl3)
# Pokemon.create(name: "Gengar", cp: rand(800), poke_type: "ghost poison", img_url: "https://img.pokemondb.net/artwork/gengar.jpg", trainer: boy4)
# Pokemon.create(name: "Blastoise", cp: rand(800), poke_type: "water", img_url: "https://img.pokemondb.net/artwork/blastoise.jpg", trainer: girl4)
