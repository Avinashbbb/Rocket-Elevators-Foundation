class CreateInterventions < ActiveRecord::Migration[5.2]
  def change
    create_table :interventions do |t|
      t.string :author
      t.string :interventionDateStart, null: false
      t.string :interventionDateEnd, null: false
      t.string :result, null: false
      t.string :report
      t.string :status, null: false
      t.integer :customer
      t.integer :employee , null: true
      t.integer :building , null: true
      t.integer :batterie , null: true
      t.integer :column , null: true
      t.integer :elevator , null: true

     
    end
  end
end
