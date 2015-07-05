require "test_helper"

describe CustomersController do
  let(:order) { orders :one }

  it "gets index" do
    get :index
    value(response).must_be :success?
    value(assigns(:customers)).wont_be :nil?
  end

  it "gets new" do
    get :new
    value(response).must_be :success?
  end

  it "creates order" do
    expect {
      post :create, order: { customer_id: order.customer_id, quantity: order.quantity }
    }.must_change "Order.count"

    must_redirect_to order_path(assigns(:order))
  end

  it "shows order" do
    get :show, id: order
    value(response).must_be :success?
  end

  it "gets edit" do
    get :edit, id: order
    value(response).must_be :success?
  end

  it "updates order" do
    put :update, id: order, order: { customer_id: order.customer_id, quantity: order.quantity }
    must_redirect_to order_path(assigns(:order))
  end

  it "destroys order" do
    expect {
      delete :destroy, id: order
    }.must_change "Order.count", -1

    must_redirect_to orders_path
  end
end
