class PagesController < ApplicationController
  before_action :set_tmdb, only: [:home]

  def home
    @most_popular = section("popular")
    @top_rating = section("top_rated")
    @upcoming = section("upcoming")
  end

  def genres

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



  end

  private

  def set_tmdb
    @token_key = ENV["TMDB_TOKEN"]
    @url = "https://api.themoviedb.org/3"
  end
