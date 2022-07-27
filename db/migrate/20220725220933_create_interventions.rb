class CreateInterventions < ActiveRecord::Migration[5.2]
  def change
    create_table :interventions do |t|
      t.string :author
      t.string :interventionDateStart, null: false
      t.string :interventionDateEnd, null: false
      t.string :result, null: false
      t.string :report
      t.string :status, null: false
      t.belongs_to :customer
      t.belongs_to :employee
      t.belongs_to :building
      t.belongs_to :batterie
      t.belongs_to :column
      t.belongs_to :elevator

     
    end
  end
end
