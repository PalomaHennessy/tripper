class CreateDestinationsTrips < ActiveRecord::Migration
  def change
    create_table :destinations_trips do |t|
      t.references :destination, index: true, foreign_key: true
      t.references :trip, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
