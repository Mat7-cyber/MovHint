class Suggestion < ApplicationRecord
  belongs_to :movie
  belongs_to :user

end
