require "test_helper"

describe CustomersController do
  let(:customer) { customers :one }

  it "gets index" do
    get :index
    value(response).must_be :success?
    value(assigns(:customers)).wont_be :nil?
  end

  it "gets new" do
    get :new
    value(response).must_be :success?
  end

  it "creates customer" do
    expect {
      post :create, customer: { address: customer.address, address_2: customer.address_2, city: customer.city, email: customer.email, first_name: customer.first_name, last_name: customer.last_name, state: customer.state, zip_code: customer.zip_code }
    }.must_change "Customer.count"

    must_redirect_to customer_path(assigns(:customer))
  end

  it "shows customer" do
    get :show, id: customer
    value(response).must_be :success?
  end

  it "gets edit" do
    get :edit, id: customer
    value(response).must_be :success?
  end

  it "updates customer" do
    put :update, id: customer, customer: { address: customer.address, address_2: customer.address_2, city: customer.city, email: customer.email, first_name: customer.first_name, last_name: customer.last_name, state: customer.state, zip_code: customer.zip_code }
    must_redirect_to customer_path(assigns(:customer))
  end

  it "destroys customer" do
    expect {
      delete :destroy, id: customer
    }.must_change "Customer.count", -1

    must_redirect_to customers_path
  end
end
