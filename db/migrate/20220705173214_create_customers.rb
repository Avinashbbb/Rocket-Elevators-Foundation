class CreateCustomers < ActiveRecord::Migration[5.2]
  def change
    create_table :customers do |t|
      t.datetime :dateCreation
      t.string :companyName, null: false
      t.string :fullName, null: false
      t.string :contactPhone, null: false
      t.string :email, null: false
      t.string :description, null: false
      t.string :companyHqAddresse
      t.string :fullNameTechnicalAuthority
      t.string :technicalAuthorityPhone
      t.string :technicalAuthorityEmail
      t.datetime :created_at
      t.datetime :updated_at
      t.belongs_to :user
      t.timestamps
    end
  end
end
