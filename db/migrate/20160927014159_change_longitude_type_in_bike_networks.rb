class ChangeLongitudeTypeInBikeNetworks < ActiveRecord::Migration[5.0]
  def change
      change_column :bike_networks, :longitude, :float
      change_column :bike_networks, :latitude, :float
  end
end
