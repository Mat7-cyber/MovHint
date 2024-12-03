class RemoveMovies < ActiveRecord::Migration[7.1]
  def change
    remove_reference :suggestions, :movie, index: true, foreign_key: true
    remove_reference :preferences, :movie, index: true, foreign_key: true

    drop_table :movies
  end
end
