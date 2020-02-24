class CreateMovies < ActiveRecord::Migration[5.0]
  def change
    create_table :movies do |t|
    	t.string :name
    	t.integer :movie_type
    	t.integer :movie_status
    	t.datetime :release_date, null: false
    	t.float :duration
    	t.float :rating
      t.timestamps
    end
  end
end
