namespace :simulation do
  desc 'Simulates orders being sold and shipped.'
  task start: :environment do
    count = 1
    loop do
      customer = Customer.create!(customer_params)
      puts "Order created for customer: #{customer.first_name} in #{customer.city}, #{customer.country}"

      sleep 5

      if count % rand(1..3) == 0
        order = Order.join_customer.with_ordered_state.first
        order.ship!
        puts "Order shipped to customer: #{order.first_name} in #{order.city}, #{order.country}"
        sleep 5
      end

      count += 1
    end
  end
end

def customer_params
  {
    email: Faker::Internet.email,
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    address: Faker::Address.street_address,
    city: Faker::Address.city,
    state: Faker::Address.state,
    zip_code: Faker::Address.zip_code,
    country: Faker::Address.country,
    order_attributes: {
      quantity: (1..10).to_a.sample
    }
  }
end
