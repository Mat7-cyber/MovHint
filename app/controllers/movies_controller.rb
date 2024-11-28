class MoviesController < ApplicationController

  def index
    if "j'ai un param sarch"
      @movies = Movie.all
    else
      @movies = Movie.all
    end
  end

  def show
    @movie = Movie.find(params[:id])
    @markers =
      {
        lat: current_user.latitude,
        lng: current_user.longitude
      }
  end
end
