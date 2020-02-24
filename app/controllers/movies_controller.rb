class MoviesController < ApplicationController
	def index
		@movies = Movie.available_movies.order('release_date')
	end

	def theaters
		@movie = Movie.find(params[:id])
		@theaters = Theater.includes([screens: [:movie_screens]]).all
		@date = params[:date].present? ? Date.strptime(params[:date], '%m/%d/%Y') : Date.today
	end
end
