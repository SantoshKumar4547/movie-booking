class Movie < ApplicationRecord
	has_many :movie_screens
	has_many :screens, through: :movie_screens
	has_many :theaters, through: :screens


	enum movie_type: { english: 0, hindi: 1}
	scope :available_movies, -> { where(movie_status: 0) }
end
