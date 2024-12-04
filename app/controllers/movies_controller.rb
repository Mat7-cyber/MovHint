class MoviesController < ApplicationController
  before_action :set_tmdb, only: [:index, :show]

  def index
    @genres = Movie::MOVIE_GENRES
    if params[:query]
      @movies = search(params[:query])
    elsif params[:genre_id]
      @movies = search_category(params[:genres_id])
    elsif params["most_popular"] == "true"
      @movies = section("popular")
    elsif params["top_rated"] == "true"
      @movies = section("top_rated")
    elsif params["upcoming"] == "true"
      @movies = section("upcoming")
    else
      @movies = Movie.all
    end


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
    @pickups = Pickup.all
    @pickups.each do |pickup|
      {  lat: pickup.latitude,
      lng: pickup.longitude,
      info_window_html: render_to_string(partial: "info_window"),
      }
    end
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

  def search(query, options = {})
    query = params[:query]
    url = "https://api.themoviedb.org/3/search/movie?query=#{query}&include_adult=false&language=en-US&page=1"
    url = URI(url)
    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true
    request = Net::HTTP::Get.new(url)
    request["accept"] = 'application/json'
    request["Authorization"] = "Bearer #{@token_key}"
    response = http.request(request)
    results = JSON.parse(response.read_body)
  end

  def search_category(query)
    query = params[:genre_id]
    url = "https://api.themoviedb.org/3/discover/movie?&with_genres=#{query}&include_adult=false&language=en-US&page=1"
    url = URI(url)
    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true
    request = Net::HTTP::Get.new(url)
    request["accept"] = 'application/json'
    request["Authorization"] = "Bearer #{@token_key}"
    response = http.request(request)
    results = JSON.parse(response.read_body)
  end

  def section(endpoint)
    url = @url
    url += "/movie/#{endpoint}?language=en-US&page=1"
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

  private

  def set_tmdb
    @token_key = ENV["TMDB_TOKEN"]
    @url = "https://api.themoviedb.org/3"
  end

  def details(movie_id)
    url = @url
    url += "/movie/#{movie_id}?language=en-US"
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


  def videos(movie_id)
    url = @url
    url += "/movie/#{movie_id}/videos?language=en-US"
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
    url += "/movie/#{movie_id}/credits?language=en-US"
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
    url += "/movie/#{movie_id}/watch/providers"
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

    # d


def watch_providers(movie_id)
  url = @url
  url += "/movie/#{movie_id}/watch/providers"
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

  def resource
    name.split('::').last.downcase
  end


end
