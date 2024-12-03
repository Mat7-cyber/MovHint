class PreferencesController < ApplicationController
  before_action :authenticate_user!

  def create
    @movie = Movie.find(params[:title])

    unless current_user.prefered_movies.include?(@movie)
      current_user.prefered_movies << @movie
    end
    redirect_to movie_path(@movie)
  end

  def destroy
    @movie = Movie.find(params[:title])

    if current_user.prefered_movies.include?(@movie)
      current_user.prefered_movies.delete(@movie)
    end
    redirect_to movie_path(@movie)
  end
end
