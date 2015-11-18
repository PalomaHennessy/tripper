class CreateDestinations < ActiveRecord::Migration
  def change
    create_table :destinations do |t|
      t.text :place
      t.string :url

      t.timestamps null: false
    end
  end
end
