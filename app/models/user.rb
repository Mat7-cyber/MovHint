class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable

  has_many :preferences
  has_many :suggestions
  has_many :prefered_movies, through: :preferences, source: :movie
  has_many :suggested_movies, through: :suggestions, source: :movie

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  has_one_attached :photo

  def suggest

    titles = preferences.pluck(:movie_id).map { |id| find_movie_title(id)}
    client = OpenAI::Client.new
    chatgpt_response = client.chat(parameters: {
      model: "gpt-4o-mini",
      temperature: 1,
      messages: [{ role: "system", content:
                  "Context: Basé sur l'API TMDB.
                  Tu vas recevoir une liste de titre de films TMDB
                  Suggères moi 10 films qui correspondents.
                  Si la liste est vide, envoie-moi les 10 plus grands films de l'histoire du cinéma.
                  Tu ne peux pas me suggérer un film que tu as reçu
                  Instructions :
                  1. Je veux une réponse en format JSON, non verbeuse.
                  2. Pas d'interpolation json
                  3. Je veux uniquement les titres des films que tu suggéreras
                  4. La clé du hash doit toujours être 'suggestions'
                  5. Donne moi uniquement les titres en anglais
                  "},
                { role: "user", content: titles.join }] # TODO : Remplacer la string par titles
    })
    content = JSON.parse(chatgpt_response["choices"][0]["message"]["content"])["suggestions"]
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
    response["original_title"]
  end

end
