json.array!(@customers) do |customer|
  json.extract! customer, :id, :email, :first_name, :last_name, :address, :address_2, :city, :state, :zip_code
  json.url customer_url(customer, format: :json)
end
