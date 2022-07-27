class CreateBatteries < ActiveRecord::Migration[5.2]
  def change
    create_table :batteries do |t|
      t.string :types, null: false
      t.string :status, null: false
      t.integer :EmployeeId, null: false
      t.datetime :date_commissioning, null: false
      t.datetime :date_last_inspection, null: false
      t.string :certificate_of_operations, null: false
      t.string :information, null: false
      t.string :notes, null: false
      t.belongs_to :building
      t.timestamps
    end
  end
end