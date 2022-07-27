class CreateBuildingDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :building_details do |t|
      t.string :InformationKey
      t.text :Value
      t.belongs_to :building

      # t.date :information_key   not sure wtf this should me
    end
  end

end
