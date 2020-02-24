class MovieScreen < ApplicationRecord
	belongs_to :movie
	belongs_to :screen
	has_many :bookings
end
