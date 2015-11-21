class CreateLatlngs < ActiveRecord::Migration
  def change
    create_table :latlngs do |t|
      t.float :lat
      t.float :long
      t.references :trip, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
