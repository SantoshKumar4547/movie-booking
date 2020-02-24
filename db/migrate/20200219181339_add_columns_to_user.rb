class AddColumnsToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :name, :string, after: :id
    add_column :users, :gender, :string, after: :email
  end
end
