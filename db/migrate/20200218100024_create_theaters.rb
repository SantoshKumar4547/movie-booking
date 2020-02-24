class CreateTheaters < ActiveRecord::Migration[5.0]
  def change
    create_table :theaters do |t|
    	t.string :name
    	t.string :street_name
    	t.string :landmark
    	t.string :city
    	t.string :state
    	t.string :pincode
      t.timestamps
    end
  end
end
