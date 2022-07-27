class AddCustomerToAddresses < ActiveRecord::Migration[5.2]
  def change
    add_reference :addresses, :customer
  end
end
