class CreateMovieScreens < ActiveRecord::Migration[5.0]
  def change
    create_table :movie_screens do |t|
    	t.references :movie
    	t.references :screen
    	t.date :show_date
    	t.time :show_time
    	t.float :ticket_price
    	t.integer :available_seats
      t.timestamps
    end
  end
end
