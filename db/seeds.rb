# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end



Movie.destroy_all

Movie.create!(
poster_path: "https://image.tmdb.org/t/p/original/zpYYN8NklsFR3iO1raCKzV3tcGf.jpg",
overview: "Howard Langston, a salesman for a mattress company, is constantly kept busy at his job, disappointing his son. After he misses his son's karate exposition, Howard vows to make it up to him by buying an action figure of his son's favorite television hero for Christmas. Unfortunately for Howard, it is Christmas Eve, and every store is sold out of Turbo Man. Now, Howard must travel all over town and compete with everybody else to find a Turbo Man action figure.",
release_date: "1996-11-21",
genres: [
  {
  "id": 10751,
  "name": "Family"
  },
  {
  "id": 35,
  "name": "Comedy"
  },
  {
  "id": 12,
  "name": "Adventure"
  }
  ],
original_title: "Jingle All the Way",
original_language: "en",
backdrop_path: "https://image.tmdb.org/t/p/original/rnn6sGMGPpM8VfVmCMFxsjKvz7q.jpg",
vote_average: 6.037,
production_companies: "20th Century Fox",
runtime: 89,
tagline: "Two dads, one toy, no prisoners.")

#
#
alex = User.create(email: "alex@mail.com", first_name:"Alex", last_name: " Truc", password: "password", address: "2 avenue des saules, Lille 59000")

Movie.create!(
  original_title: "The Dark Knight",
poster_path: "https://xl.movieposterdb.com/08_06/2008/468569/xl_468569_fe24b125.jpg",
vote_average: 9.0,
genres: "Thriller",
release_date: "13 january 2008"
)

Movie.create!(
  original_title: "The Lord of the Rings: The Return of the King",
  poster_path: "https://xl.movieposterdb.com/22_11/2003/167260/xl_the-lord-of-the-rings-the-return-of-the-king-movie-poster_a977da10.jpg",
vote_average: 8.0,
genres: "Fantasy",
release_date: "1 january 2003"
)

Movie.create!(
  original_title: "The Lord of the Rings: The Return of the King",
  poster_path: "https://xl.movieposterdb.com/20_06/2018/1677720/xl_1677720_376c9e0b.jpg",
vote_average: 8.0,
genres: "Fantasy",
release_date: "2003"
)

Movie.create!(
  original_title: "Harry potter",
  poster_path: "https://xl.movieposterdb.com/21_03/1993/108052/xl_108052_bd91d0b6.jpg",
vote_average: 5.0,
genres: "Horror",
release_date: "2003"
)


# useful pour les vidéos https://www.youtube.com/watch?v=BzoHTJdzniQ

