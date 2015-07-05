require 'test_helper'

describe Customer do
  let(:valid_attr) { { email: Faker::Internet.email, first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, address: Faker::Address.street_address, city: Faker::Address.city, state: Faker::Address.state, zip_code: Faker::Address.zip_code, country: Faker::Address.country } }
  let(:invalid_attr) { {} }

  describe 'with valid attributes' do
    it 'must be valid' do
      value(Customer.new(valid_attr)).must_be :valid?
    end
  end

  describe 'with valid attributes' do
    it 'must be valid' do
      value(Customer.new(invalid_attr)).must_be :invalid?
    end
  end
end
