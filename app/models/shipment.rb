class Shipment < ApplicationRecord
  belongs_to :user
  belongs_to :service

  validates :customer, presence: true
  validates :address, presence: true
  validates :contact, presence: true
  validates :total_weight, presence: true
  validates :ship_date, presence: { message: 'must be formatted as follows: mm/dd/yyyy' }
  validates :tracking_number, presence: true
  validates :status, presence: true
  validates_inclusion_of :status, :in => %w( In-transit Delivered )

  def self.sort_shipments
    order(:customer)
  end
  
  def self.pending_shipments
    where(status: "In-transit")
  end

  def self.delivered_shipments
    where(status: "Delivered")
  end

end

