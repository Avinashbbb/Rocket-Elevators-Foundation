class CreateQuotes < ActiveRecord::Migration[5.2]
  def change
    create_table :quotes,id: false do |t|
      t.integer :id, primary_key: true, null: false
      t.string :type_building, null: false
      t.integer :numApartment
      t.integer :numFloor
      t.integer :numElevator
      t.integer :numOccupant
      t.string :companyName
      t.string :email
      t.datetime :created_at, null: false
      t.datetime :updated_at, null: false
      t.belongs_to :user
      t.timestamps
    end
  end
end
