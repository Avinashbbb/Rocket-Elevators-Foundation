class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.string :address_type, null: false
      t.string :status, null: false
      t.string :entity, null: false
      t.string :numberAndStreet, null: false
      t.string :suiteOrApartment, null: false
      t.string :city, null: false
      t.string :postal_code, null: false
      t.string :country, null: false
      t.string :notes, null: false
      t.timestamps
    end
  end
end
