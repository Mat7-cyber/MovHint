class MoviesController < ApplicationController
  before_action :set_tmdb, only: [:index]

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
    @liked = false
  end

  def search
    query = params[:query]
    if query.present?
      url = "https://api.themoviedb.org/3/search/movie?query=#{query}&include_adult=false&language=en-US&page=1"
      url = URI(url)
      http = Net::HTTP.new(url.host, url.port)
      http.use_ssl = true
      request = Net::HTTP::Get.new(url)
      request["accept"] = 'application/json'
      request["Authorization"] = "Bearer #{@token_key}"

      response = http.request(request)
      @results = JSON.parse(response.read_body)
      @genres = Movie::MOVIE_GENRES
    else
      @results = []
    end
  end

  private

  def set_tmdb
    @token_key = ENV["TMDB_TOKEN"]
  end

end
