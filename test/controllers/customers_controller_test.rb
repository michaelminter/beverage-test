require 'test_helper'

describe CustomersController do
  let(:customer) { customers :one }
  let(:valid_params) {
    { customer: { address: customer.address, address_2: customer.address_2, city: customer.city, email: customer.email, first_name: customer.first_name, last_name: customer.last_name, state: customer.state, zip_code: customer.zip_code, order_attributes: { quantity: 4 } } }
  }
  let(:invalid_params) { { customer: { address: '' } } }

  describe '#new' do
    it 'gets new' do
      get :new
      value(response).must_be :success?
    end
  end

  describe '#create' do
    describe 'with valid params' do
      it 'is successful' do
        post :create, valid_params
        assert_response :redirect
      end

      it 'should redirect to root' do
        post :create, valid_params
        assert_redirected_to root_url
      end

      it 'creates customer' do
        expect { post :create, valid_params }.must_change 'Customer.count'
      end

      it 'creates order' do
        expect { post :create, valid_params }.must_change 'Order.count'
      end

      it 'redirects to root' do
        post :create, valid_params
        must_redirect_to root_path
      end
    end

    describe 'with invalid params' do
      it 'is successful' do
        post :create, invalid_params
        assert_response :success
      end

      it 'renders new' do
        post :create, invalid_params
        assert_template :new
      end

      it 'will not create customer' do
        expect { post :create, invalid_params }.wont_change 'Customer.count'
      end

      it 'will not create order' do
        expect { post :create, invalid_params }.wont_change 'Order.count'
      end
    end
  end
end
