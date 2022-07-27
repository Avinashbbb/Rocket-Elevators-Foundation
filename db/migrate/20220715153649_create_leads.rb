class CreateLeads < ActiveRecord::Migration[5.2]
  def change
    create_table :leads do |t|
      t.string :fullNameContact
      t.string :companyName
      t.string :email
      t.string :phoneNumber
      t.string :nameProject
      t.string :descriptionProject
      t.string :department
      t.string :message
      t.blob :file
      t.datetime :date
      t.belongs_to :customer

      t.timestamps
    end
  end
end
