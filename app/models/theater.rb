class Theater < ApplicationRecord
	has_many :screens
	has_many :movie_screens, through: :screens
end
