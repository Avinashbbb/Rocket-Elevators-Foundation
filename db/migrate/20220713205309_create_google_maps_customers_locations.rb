class CreateGoogleMapsCustomersLocations < ActiveRecord::Migration[5.2]
  def change
    create_table :google_maps_customers_locations do |t|
      t.string :location_building
      t.integer :building_floors
      t.string :client_name
      t.integer :nb_battries
      t.integer :nb_columns
      t.integer :nb_elevators
      t.string :tech_contact

      t.timestamps
    end
  end
end
