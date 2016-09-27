class CreateBikeNetworks < ActiveRecord::Migration[5.0]
  def change
    create_table :bike_networks do |t|
      t.string :api_id
      t.string :company_name
      t.string :city
      t.string :country
      t.integer :latitude
      t.integer :longitude

      t.timestamps
    end
  end
end
