class Order < ActiveRecord::Base
  belongs_to :customer

  validates :quantity, presence: true
end
