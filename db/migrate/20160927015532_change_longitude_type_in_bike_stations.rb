class ChangeLongitudeTypeInBikeStations < ActiveRecord::Migration[5.0]
  def change
      change_column :bike_stations, :latitude, :float
      change_column :bike_stations, :longitude, :float
  end
end
