class CreateColumns < ActiveRecord::Migration[5.2]
  def change
    create_table :columns do |t|
      t.string :types, null: false
      t.string :model
      t.string :numberFloorServed, null: false
      t.string :status, null: false
      t.string :information, null: false
      t.string :notes, null: false
      t.belongs_to :batterie
      t.timestamps
    end
  end
end