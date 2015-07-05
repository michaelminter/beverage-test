class Customer < ActiveRecord::Base
  has_one :order
  accepts_nested_attributes_for :order

  validates :first_name, presence: true
  validates :address, presence: true
  validates :city, presence: true
  validates :state, presence: true
  validates :zip_code, presence: true
end
