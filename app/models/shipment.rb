class Shipment < ApplicationRecord
  belongs_to :user
  belongs_to :service

  validates :customer, presence: true
  validates :adress, presence: true
  validates :contact, presence: true
  validates :total_weight, presence: true, numerically: {only_integer: true, greater_than: 0, less_than: 30,000} 
  validates :ship_date, presence: true
  validates :tracking_number, presence: true
  validates :status, presence: true
end

