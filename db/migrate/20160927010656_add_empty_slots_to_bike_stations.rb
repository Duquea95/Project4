class AddEmptySlotsToBikeStations < ActiveRecord::Migration[5.0]
  def change
    add_column :bike_stations, :empty_slots, :integer
  end
end
