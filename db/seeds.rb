require "uri"
require "net/http"

url = URI("https://api.themoviedb.org/3")
Token_key = ENV["TMDB_TOKEN"]
# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

User.all.each do |user|
  user.photo.purge
end
User.destroy_all
# Movie.destroy_all

# Movie.create!(
# poster_path: "https://image.tmdb.org/t/p/original/zpYYN8NklsFR3iO1raCKzV3tcGf.jpg",
# overview: "Howard Langston, a salesman for a mattress company, is constantly kept busy at his job, disappointing his son. After he misses his son's karate exposition, Howard vows to make it up to him by buying an action figure of his son's favorite television hero for Christmas. Unfortunately for Howard, it is Christmas Eve, and every store is sold out of Turbo Man. Now, Howard must travel all over town and compete with everybody else to find a Turbo Man action figure.",
# release_date: "1996-11-21",
# genres: [
#   {
#   "id": 10751,
#   "name": "Family"
#   },
#   {
#   "id": 35,
#   "name": "Comedy"
#   },
#   {
#   "id": 12,
#   "name": "Adventure"
#   }
#   ],
# original_title: "Jingle All the Way",
# original_language: "en",
# backdrop_path: "https://image.tmdb.org/t/p/original/rnn6sGMGPpM8VfVmCMFxsjKvz7q.jpg",
# vote_average: 6.037,
# production_companies: "20th Century Fox",
# runtime: 89,
# tagline: "Two dads, one toy, no prisoners.")

# Movie.create!(
# poster_path: "https://image.tmdb.org/t/p/original/fn3aXwADNC0nmJ51GYnkrOseVgB.jpg",
# overview: "NYPD cop John McClane's plan to reconcile with his estranged wife is thrown for a serious loop when, minutes after he arrives at her office, the entire building is overtaken by a group of terrorists. With little help from the LAPD, wisecracking McClane sets out to single-handedly rescue the hostages and bring the bad guys down.",
# release_date: "1988-07-15",
# genres: [
#   {
#   "id": 28,
#   "name": "Action"
#   },
#   {
#   "id": 53,
#   "name": "Thriller"
#   },
#   ],
# original_title: "Die Hard",
# original_language: "en",
# backdrop_path: "https://image.tmdb.org/t/p/original/5kHVblr87FUScuab1PVSsK692IL.jpg",
# vote_average: 7.8,
# production_companies: "20th Century Fox",
# runtime: 132,
# tagline: "Twelve terrorists. One cop. The odds are against John McClane... That's just the way he likes it.")

# Movie.create!(
# poster_path: "https://image.tmdb.org/t/p/original/oQffRNjK8e19rF7xVYEN8ew0j7b.jpg",
# overview: "Tired of scaring humans every October 31 with the same old bag of tricks, Jack Skellington, the spindly king of Halloween Town, kidnaps Santa Claus and plans to deliver shrunken heads and other ghoulish gifts to children on Christmas morning. But as Christmas approaches, Jack's rag-doll girlfriend, Sally, tries to foil his misguided plans.",
# release_date: "1993-10-09",
# genres: [
#   {
#   "id": 14,
#   "name": "Fantasy"
#   },
#   {
#   "id": 16,
#   "name": "Animation"
#   },
#   {
#   "id": 10751,
#   "name": "Family"
#   }
#   ],
# original_title: "The Nightmare Before Christmas",
# original_language: "en",
# backdrop_path: "https://image.tmdb.org/t/p/original/xWT5F1DNxciNLEMXRl49iq8zvN7.jpg",
# vote_average: 7.841,
# production_companies: "Touchstone Pictures",
# runtime: 76,
# tagline: "What's this?")

#
upload = Cloudinary::Uploader.upload('https://cdn.futura-sciences.com/cdn-cgi/image/width=1920,quality=50,format=auto/sources/images/AI-creation.jpg')
User.create(email: "alex@mail.com", first_name:"Alex", last_name: " Truc", password: "password", address: "2 avenue des saules, Lille 59000").photo.attach(io: URI.open(upload['secure_url']), filename: 'avatar.png')

# useful pour les vidéos https://www.youtube.com/watch?v=lVtetOjX_vk

Pickup.destroy_all

Pickup.create!(
  name: "UGC Ciné Cité Lille",
  address: "40 Rue de Béthune, 59800 Lille",
  latitude: 50.633949279785156,
  longitude:3.0634238719940186
)

Pickup.create!(
  name: "UGC Ciné Cité Villeneuve d'Ascq",
  address: "21 Av. de l'Avenir, 59650 Villeneuve-d'Ascq",
  latitude: 50.6159019,
  longitude:3.1255409
)

Pickup.create!(
  name: "Kinepolis",
  address: "1 Rue du Château d'Isenghien, 59160 Lille",
  latitude: 50.6514817,
  longitude:2.9810566
)

Pickup.create!(
  name: "FNAC Lille",
  address: "20 Rue Saint-Nicolas, 59000 Lille",
  latitude: 50.6360159,
  longitude:3.0647206
)

Pickup.create!(
  name: "FNAC Lille - Gare Lille-Flandres",
  address: "Gare SNCF Lille Flandres, Pl. des Buisses, 59000 Lille",
  latitude: 50.633,
  longitude:3.0586
)
