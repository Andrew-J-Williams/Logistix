class Shipment < ApplicationRecord
  belongs_to :user
  belongs_to :service

  validates :customer, presence: true
  validates :address, presence: true
  validates :contact, presence: true
  validates :total_weight, presence: true
  validates :ship_date, presence: { message: 'must be formatted as follows: dd/mm/yyyy' }
  validates :tracking_number, presence: true
  validates :status, presence: true
  validates_inclusion_of :status, :in => %w( In-transit Delivered )

  scope :sort_shipments, -> { order(customer: :asc) } # Our scope methods for shipments
  scope :sort_by_date, -> { order(ship_date: :asc) }
  scope :pending_shipments, -> { where(status: "In-transit") }
  scope :delivered_shipments, -> { where(status: "Delivered") }

end

