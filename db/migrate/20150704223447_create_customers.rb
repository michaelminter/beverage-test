class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.string :email
      t.string :first_name
      t.string :last_name
      t.string :address
      t.string :address_2
      t.string :city
      t.string :state
      t.string :zip_code

      t.timestamps null: false
    end
  end
end
