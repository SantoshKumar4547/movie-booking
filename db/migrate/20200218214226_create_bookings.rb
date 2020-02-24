class CreateBookings < ActiveRecord::Migration[5.0]
  def change
    create_table :bookings do |t|
    	t.references :user
    	t.references :movie_screen
    	t.integer :booked_seats
    	t.float :amount

      t.timestamps
    end
  end
end
