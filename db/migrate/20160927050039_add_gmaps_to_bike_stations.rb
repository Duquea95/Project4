class AddGmapsToBikeStations < ActiveRecord::Migration[5.0]
  def change
    add_column :bike_stations, :gmaps, :boolean
  end
end
