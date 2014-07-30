class CreateTrips < ActiveRecord::Migration
  def change
    create_table :trips do |t|
      t.string :trip_name
      t.string :location
      t.integer :user_id
      t.text :to_pack
      t.text :to_do
      t.integer :budget

      t.timestamps
    end
  end
end
