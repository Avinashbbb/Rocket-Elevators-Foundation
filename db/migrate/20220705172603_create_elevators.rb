class CreateElevators < ActiveRecord::Migration[5.2]
  def change
    create_table :elevators do |t|
      t.string :serial_number, null: false
      t.string :companyName, null: false
      t.string :model, null: false
      t.string :fullName, null: false
      t.string :email, null: false
      t.string :types, null: false
      t.string :status, null: false
      t.datetime :dateCommissioning, null: false
      t.datetime :dateLastInspection, null: false
      t.string :certificateOperations, null: false
      t.string :information, null: false
      t.string :notes, null: false
      t.belongs_to :column
      t.timestamps
    end
  end
end