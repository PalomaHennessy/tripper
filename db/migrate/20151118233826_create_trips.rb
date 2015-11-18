class CreateTrips < ActiveRecord::Migration
  def change
    create_table :trips do |t|
      t.string :start_point
      t.string :end_point
      t.string :trip_name

      t.timestamps null: false
    end
  end
end
