class BookingsController < ApplicationController

	def index
		@bookings = Booking.all.where(user_id: current_user.id)
	end

	def book_ticket
		if user_signed_in?
			@bookings = Booking.all.where(user_id: current_user.id)
			@booking_details = MovieScreen.find(params[:id])
		end
	end

	def ticket_checkout	
		movie_screen = MovieScreen.find(params[:movie_screen_id])
		data = {'status' => 'success'}
		booking_hash = {}
		booking_hash[:user_id ] = current_user.id
		booking_hash[:movie_screen_id ] = params[:movie_screen_id]
		booking_hash[:booked_seats ] = params[:booked_seats]
		booking_hash[:amount ] = params[:amount]
		booking = Booking.new(booking_hash)

		if booking.valid?
			booking.save!
			movie_screen.available_seats -= params[:booked_seats].to_i
			movie_screen.save!
		else
			data = {'status' => 'failure'}
		end		
	 	render json: data
	end

	def destroy
		booking = Booking.find(params[:id])
		movie_screen = booking.movie_screen
		movie_screen.available_seats += booking.booked_seats
		movie_screen.save!
		booking.destroy
		redirect_to bookings_url
	end
end
