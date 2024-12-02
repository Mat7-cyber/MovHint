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

    client = OpenAI::Client.new
    chatgpt_response = client.chat(parameters: {
      model: "gpt-4o-mini",
      messages: [{ role: "user", content: "voici une liste de films : #{@original_titles} fais moi une suggestions de 5 films par rapport à ceux donnés ci-dessus
instruction :
pas d'interpolation json
Je veux uniquement les titres des films que tu suggéreras
Je veux une réponse en format json, non verbeuse"}]
    })
    content = chatgpt_response["choices"][0]["message"]["content"]
  end


end
