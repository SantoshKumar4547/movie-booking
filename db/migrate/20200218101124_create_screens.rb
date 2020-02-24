class CreateScreens < ActiveRecord::Migration[5.0]
  def change
    create_table :screens do |t|
    	t.string :name
    	t.references :theater #index
    	t.integer :no_of_seats
      t.timestamps
    end
  end
end
