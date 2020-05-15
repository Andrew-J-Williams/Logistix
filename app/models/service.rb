class Service < ApplicationRecord
  belongs_to :carrier
  has_many :shipments
  has_many :users, through: :shipments

  accepts_nested_attributes_for :carrier

  validates :name, presence: true

  def self.sort_service
    order(:name)
  end

  def name_and_carrier
    "#{name} - #{carrier.try(:name)}"
  end

  def unique_service
    service = Service.find_by(name: name, carrier_id: carrier_id)

    if !!service && service != self
      errors.add(:name, "is already an option with this carrier.")
    end
  end

end
