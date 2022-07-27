class AddBuildingToAddresses < ActiveRecord::Migration[5.2]
  def change
    add_reference :addresses, :building
  end
end
