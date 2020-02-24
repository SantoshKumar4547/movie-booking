# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

movies = [
					{name: 'Star Wars', movie_type: 0, movie_status: 0, release_date: '2020-02-18 06:57:12'},
					{name: 'Lord of the Rings', movie_type: 0, movie_status: 0, release_date: '2020-02-15 06:57:12'},
					{name: 'Love Aaj Kal', movie_type: 1, movie_status: 0, release_date: '2020-02-17 06:57:12'},
					{name: 'TanhaJi 3D', movie_type: 1, movie_status: 0, release_date: '2020-02-12 06:57:12'},
					{name: 'Malang', movie_type: 1, movie_status: 0, release_date: '2020-02-11 06:57:12'}
				]

movies.each do |movie|
	m = Movie.find_or_initialize_by( name: movie[ :name ])
	if m.new_record?
		m.attributes = movie.except(:name)
		m.save!
	end
end

theaters = [
						{name: 'Cinepolis', street_name: 'DLF Avenue', landmark: 'Saket', city: 'Delhi', state: 'Delhi', pincode: '100096'},
						{name: 'Spice Cinema', street_name: 'Sector 25', landmark: 'Spice Mall', city: 'Noida', state: 'U.P.', pincode: '201301'},
						{name: 'PVR', street_name: 'Naraina', landmark: 'Pacific Mall', city: 'Delhi', state: 'Delhi', pincode: '100090'},
						{name: 'Wave', street_name: 'DLF phase-5', landmark: 'Raja Garden', city: 'Delhi', state: 'Delhi', pincode: '100006'},
						{name: 'Carnival', street_name: 'Sector 18', landmark: 'TGIP', city: 'Noida', state: 'U.P.', pincode: '201301'}
						]

	theaters.each do |theater|
	t = Theater.find_or_initialize_by(theater)
	if t.new_record?
		t.save!
	end
end

screens = [
						{name: 'Screen-1', no_of_seats: 20},
						{name: 'Screen-2', no_of_seats: 40},
						{name: 'Screen-3', no_of_seats: 60},
						{name: 'Screen-4', no_of_seats: 60},
						{name: 'Screen-5', no_of_seats: 60}
					]

Theater.all.each do |theater|
	screens.each do |screen|
		screen[:theater_id] = theater.id
		s = Screen.find_or_initialize_by(screen)
		if s.new_record?
  		s.save!
  	end
	end
end
  
movie_screens = [
					{show_date: '25/02/2020', show_time: '10:35', ticket_price: 100, screen_id: 1},
					{show_date: '25/02/2020', show_time: '12:15', ticket_price: 100, screen_id: 1},
					{show_date: '25/02/2020', show_time: '13:45', ticket_price: 100, screen_id: 1},
					{show_date: '25/02/2020', show_time: '14:00', ticket_price: 150, screen_id: 1},
					{show_date: '25/02/2020', show_time: '17:40', ticket_price: 100, screen_id: 1},
					{show_date: '25/02/2020', show_time: '20:30', ticket_price: 200, screen_id: 1},
					{show_date: '25/02/2020', show_time: '22:30', ticket_price: 200, screen_id: 1}
				]

# Movie.all.each do |movie|
# 	movie_screens.each do |movie_screen|
# 		movie_screen[:movie_id] = movie.id
# 	end
# 	Theater.all.each do |theater|
# 		movie_screens.each do |movie_screen|
# 			movie_screen[:screen_id] = theater.screens.first.id
# 			movie_screen[:available_seats] = theater.screens.first.no_of_seats
# 			ms = MovieScreen.find_or_initialize_by(show_date: movie_screen[ :show_date ], show_time: movie_screen[ :show_time], screen_id: movie_screen[ :screen_id])
# 			if ms.new_record?
# 	  		ms.attributes = movie_screen.except(:show_date)
# 	  		ms.attributes = movie_screen.except(:show_time)
# 	  		ms.attributes = movie_screen.except(:screen_id)
# 	  		ms.save!
# 	  	end
# 		end
# 	end	
# end

Movie.all.each do |movie|
	Theater.all.each do |theater|
		screen_id = theater.screens[movie.id - 1].id
		movie_screens.each do |movie_screen|
			movie_screen[:movie_id] = movie.id
			movie_screen[:screen_id] = screen_id
			movie_screen[:available_seats] = theater.screens.first.no_of_seats
			ms = MovieScreen.find_or_initialize_by(movie_screen)
			if ms.new_record?
		  		ms.save!
		  	end
		end
	end
end
