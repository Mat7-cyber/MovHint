module PageHelper
  def find_movie_id(title)
    new_title = URI.encode_www_form_component(title)
    url = "https://api.themoviedb.org/3/search/movie?query=#{new_title}&include_adult=false&language=en-US&page=1"
    url = URI(url)
    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true
    request = Net::HTTP::Get.new(url)
    request["accept"] = 'application/json'
    request["Authorization"] = "Bearer #{@token_key}"

    response = http.request(request)
    response = JSON.parse(response.read_body)
    response["results"].first["id"]
  end

  def find_movie_poster(id)
    url = "https://api.themoviedb.org/3/movie/#{id}?language=en-US"
    url = URI(url)
    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true
    request = Net::HTTP::Get.new(url)
    request["accept"] = 'application/json'
    request["Authorization"] = "Bearer #{@token_key}"

    response = http.request(request)
    response = JSON.parse(response.read_body)
    response["poster_path"]
  end


end
