class DashboardsController < ApplicationController
  before_action :authenticate_user!, only: [:show, :preferences]

  def show
    @user = current_user
  end

  def preferences
    preferences = current_user.preferences
    @original_titles = preferences.pluck(:movie_id).map { |movie_id| find_movie_title(movie_id) }
  end

  private

  def find_movie_title(id)
    url = "https://api.themoviedb.org/3/movie/#{id}?language=en-US"
    url = URI(url)
    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true
    request = Net::HTTP::Get.new(url)
    request["accept"] = 'application/json'
    request["Authorization"] = "Bearer #{ENV["TMDB_TOKEN"]}"

    response = http.request(request)
    response = JSON.parse(response.read_body)
    title = response["original_title"]
  end


end
