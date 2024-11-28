class MoviesController < ApplicationController

  def index
    @movies = Movie.all
  end

  def show
    @movie = Movie.find(params[:id])
    @markers =
      {
        lat: current_user.latitude,
        lng: current_user.longitude
      }
    @liked = false
  end
end
