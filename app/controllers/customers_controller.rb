class CustomersController < ApplicationController
  # GET /customers/new
  def new
    @customer = Customer.new
    @customer.build_order
  end

  # POST /customers
  def create
    @customer = Customer.new(order_params)

    if @customer.save
      redirect_to root_path, notice: 'Order was successfully generated.'
    else
      render :new
    end
  end

  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_params
      params.require(:customer).permit(:email, :first_name, :last_name, :address, :address_2, :city, :state, :zip_code, order_attributes: [:quantity])
    end
end
