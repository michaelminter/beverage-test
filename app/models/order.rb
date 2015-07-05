class Order < ActiveRecord::Base
  belongs_to :customer

  validates :quantity, presence: true, numericality: { only_integer: true }
end
