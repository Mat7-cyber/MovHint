class PreferencesController < ApplicationController
  before_action :authenticate_user!

  def create
    @movie = Movie.find(params[:movie_id])

    unless current_user.prefered_movies.include?(@movie)
      current_user.prefered_movies << @movie
    end

    redirect_to movie_path(@movie), notice: 'Movie added to your preferences!'
  end

  def destroy
    @movie = Movie.find(params[:movie_id])

    if current_user.prefered_movies.include?(@movie)
      current_user.prefered_movies.delete(@movie)
    end

    redirect_to movie_path(@movie), notice: 'Movie removed from your preferences.'
  end
end
