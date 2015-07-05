class Order < ActiveRecord::Base
  belongs_to :customer

  validates :quantity, presence: true, numericality: { only_integer: true }

  include Workflow
  workflow do
    state :ordered do
      event :ship, :transitions_to => :shipped
    end
    state :shipped do
      event :return, transitions_to: :returned
    end
    state :returned
  end

  after_create :send_order

  scope :sold_count, -> { sum(:quantity) }
  scope :shipped_count, -> { with_shipped_state.sum(:quantity) }
  scope :join_customer, -> { joins(:customer).select('orders.*, customers.*') }

  def send_order
    Messenger::Publish.new(:ordered, customer_message).call
  end

  def ship
    Messenger::Publish.new(:shipped, customer_message).call
  end

  def customer_message
    {
      first_name: customer.first_name,
      city: customer.city,
      country: customer.country,
      quantity: quantity
    }
  end
end
