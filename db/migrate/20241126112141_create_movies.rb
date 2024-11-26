class CreateMovies < ActiveRecord::Migration[7.1]
  def change
    create_table :movies do |t|
      t.string :poster_path
      t.string :overview
      t.string :release_date
      t.string :genres
      t.string :original_title
      t.string :original_language
      t.string :backdrop_path
      t.float :vote_average
      t.string :production_companies
      t.integer :runtime
      t.string :tagline

      t.timestamps
    end
  end
end
