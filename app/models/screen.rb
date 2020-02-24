class Screen < ApplicationRecord
	has_many :movie_screens
	belongs_to :theater
end
