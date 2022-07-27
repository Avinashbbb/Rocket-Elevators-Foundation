class CreateEmployees < ActiveRecord::Migration[5.2]
  def change
    create_table :employees do |t|
      t.string :firstNname, null: false
      t.string :lastName, null: false
      t.string :title, null: false
      t.belongs_to :user
      t.timestamps
    end
  end
end