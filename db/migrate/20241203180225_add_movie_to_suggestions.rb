class AddMovieToSuggestions < ActiveRecord::Migration[7.1]
  def change
    add_column :suggestions, :movie_id, :integer
  end
end
