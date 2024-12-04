class AddMovieToReferences < ActiveRecord::Migration[7.1]
  def change
    add_column :preferences, :movie_id, :integer
  end
end
