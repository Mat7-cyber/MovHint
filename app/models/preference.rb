class Preference < ApplicationRecord
  belongs_to :movie
  belongs_to :user
end
