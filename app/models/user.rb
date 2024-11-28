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

end
