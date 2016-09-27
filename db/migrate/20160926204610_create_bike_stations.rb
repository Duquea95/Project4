class CreateBikeStations < ActiveRecord::Migration[5.0]
  def change
    create_table :bike_stations do |t|
      t.string :address
      t.integer :latitude
      t.integer :longitude
      t.integer :total_slots
      t.integer :bikes_available
      t.string :last_updated

      t.timestamps
    end
  end
end
