class MoviesController < ApplicationController
  before_action :set_tmdb, only: [:index, :show]

  def index
      @movies = Movie.all
  end

  def show
    movie_id = find_movie_id(params[:title])
    @movie = details(movie_id)
    @casting = credits(movie_id)
    @trailer = videos(movie_id)
    @stream = watch_providers(movie_id)
    @directors = @casting["crew"]
    .select { |hash| hash["job"] == "Director" }
    .map { |hash| hash["name"] }
    .join(", ")
    @trailers = @trailer["results"]
    .select { |hash| hash["type"] == "Trailer" }
    .map { |hash| hash["key"] }
    .join(", ")
    @markers =
      {
        lat: current_user.latitude,
        lng: current_user.longitude
      }
    @liked = false
  end

  def find_movie_id(title)
    url = "https://api.themoviedb.org/3/search/movie?query=#{title}&include_adult=false&language=en-US&page=1"
      url = URI(url)
      http = Net::HTTP.new(url.host, url.port)
      http.use_ssl = true
      request = Net::HTTP::Get.new(url)
      request["accept"] = 'application/json'
      request["Authorization"] = "Bearer #{@token_key}"

      response = http.request(request)
      response = JSON.parse(response.read_body)
      movie_id = response["results"][0]["id"]
      return movie_id
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
    @url = "https://api.themoviedb.org/3/movie/"
  end

  def details(movie_id)
    url = @url
    url += "#{movie_id}?language=en-US"
    url = URI(url)
    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true
    request = Net::HTTP::Get.new(url)
    request["accept"] = 'application/json'
    request["Authorization"] = "Bearer #{@token_key}"
    response = http.request(request)
    response = JSON.parse(response.read_body)
    @genres = Movie::MOVIE_GENRES
    return response
  end
end

def videos(movie_id)
  url = @url
  url += "#{movie_id}/videos?language=en-US"
  url = URI(url)
  http = Net::HTTP.new(url.host, url.port)
  http.use_ssl = true
  request = Net::HTTP::Get.new(url)
  request["accept"] = 'application/json'
  request["Authorization"] = "Bearer #{@token_key}"
  response = http.request(request)
  response = JSON.parse(response.read_body)
  @genres = Movie::MOVIE_GENRES
  return response
end

def credits(movie_id)
  url = @url
  url += "#{movie_id}/credits?language=en-US"
  url = URI(url)
  http = Net::HTTP.new(url.host, url.port)
  http.use_ssl = true
  request = Net::HTTP::Get.new(url)
  request["accept"] = 'application/json'
  request["Authorization"] = "Bearer #{@token_key}"
  response = http.request(request)
  response = JSON.parse(response.read_body)
  @genres = Movie::MOVIE_GENRES
  return response
end

def watch_providers(movie_id)
  url = @url
  url += "#{movie_id}/watch/providers"
  url = URI(url)
  http = Net::HTTP.new(url.host, url.port)
  http.use_ssl = true
  request = Net::HTTP::Get.new(url)
  request["accept"] = 'application/json'
  request["Authorization"] = "Bearer #{@token_key}"
  response = http.request(request)
  response = JSON.parse(response.read_body)
  @genres = Movie::MOVIE_GENRES
  return response
end
