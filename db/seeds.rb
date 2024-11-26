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
alex = User.create(email: "alex@mail.com", password: "password", address: "2 avenue des saules, Lille 59000")

Movie.create!(
  original_title: "The Dark Knight",
poster_path: "https://xl.movieposterdb.com/08_06/2008/468569/xl_468569_fe24b125.jpg",
vote_average: 9.0,
genres: "Thriller",
release_date: "2008"
)

Movie.create!(
  original_title: "The Lord of the Rings: The Return of the King",
  poster_path: "https://xl.movieposterdb.com/22_11/2003/167260/xl_the-lord-of-the-rings-the-return-of-the-king-movie-poster_a977da10.jpg",
vote_average: 8.0,
genres: "Fantasy",
release_date: "2003"
)
