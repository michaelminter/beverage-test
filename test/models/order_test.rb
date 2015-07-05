require 'test_helper'

describe Order do
  let(:customer_params) {
    { email: Faker::Internet.email, first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, address: Faker::Address.street_address, city: Faker::Address.city, state: Faker::Address.state, zip_code: Faker::Address.zip_code, country: Faker::Address.country, order_attributes: { quantity: 4 } }
  }
  let(:order) { Customer.create(customer_params).order }
  let(:valid_params) { { quantity: 1 } }
  let(:invalid_params) { { quantity: nil } }

  describe 'with valid params' do
    it 'must be valid' do
      value(Order.new(valid_params)).must_be :valid?
    end
  end

  describe 'with invalid params' do
    it 'must be valid' do
      value(Order.new(invalid_params)).must_be :invalid?
    end
  end

  describe 'workflow state' do
    it 'should default to ordered' do
      value(order.workflow_state).must_equal 'ordered'
    end

    describe 'ordered' do
      it 'should transition to shipped' do
        order.ship!
        value(order.workflow_state).must_equal 'shipped'
      end
    end
  end

  describe '#sold_count' do
    it 'should return value' do
      value(Order.sold_count).must_equal 20
    end
  end

  describe '#shipped_count' do
    it 'should return value' do
      value(Order.shipped_count).must_equal 13
    end
  end

  describe '#join_customer' do
    it 'should return value' do
      value(Order.join_customer.first.email).must_equal 'michael@imap.com'
    end
  end
end
