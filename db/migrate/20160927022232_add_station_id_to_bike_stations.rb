class AddStationIdToBikeStations < ActiveRecord::Migration[5.0]
  def change
    add_column :bike_stations, :station_id, :float
  end
end
