class CreateBuildings < ActiveRecord::Migration[5.2]
  def change
    create_table :buildings do |t|
      t.string :addressOfBuilding
      t.string :full_name_building_admin, null: false
      t.string :email_building_admin, null: false
      t.string :phone_building_admin, null: false
      t.string :full_name_technical_authority, null: false
      t.string :email_technical_authority, null: false
      t.string :phone_technical_authority, null: false
      t.string :interventionDateStart
      t.string :interventionDateEnd
      t.belongs_to :customer
      t.timestamps
    end
  end
end