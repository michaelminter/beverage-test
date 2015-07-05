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
end
