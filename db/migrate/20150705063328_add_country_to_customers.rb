class AddCountryToCustomers < ActiveRecord::Migration
  def change
    add_column :customers, :country, :string, after: :zip_code
  end
end
