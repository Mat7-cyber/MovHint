class Movie < ApplicationRecord
  has_many :preferences
  has_many :suggestions
end
