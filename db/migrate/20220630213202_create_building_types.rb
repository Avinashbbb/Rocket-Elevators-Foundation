class CreateBuildingTypes < ActiveRecord::Migration[5.2]
  def change
    create_table :building_types do |t|
      t.integer :number_apartments
      t.integer :number_floors
      t.integer :number_elevators
      t.integer :number_occupants
      t.string :companyName
      t.string :email
      t.datetime :created_at, null: false
      t.datetime :updated_at, null: false
      t.timestamps
    end
  end
end
