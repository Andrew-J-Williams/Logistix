class Service < ApplicationRecord
  belongs_to :carrier
  has_many :shipments
  has_many :users, through: :shipments

  accepts_nested_attributes_for :carrier

  validates :name, presence: true
  validates :unique_service

  def self.sort_service
    order(:name)
  end

  def name_and_carrier
    "#{name} - #{carrier.try(:name)}"
  end

  def unique_service # our method for avoiding duplicate services attached to specific carriers.
    service = Service.find_by(name: name, carrier_id: carrier_id) # first, we search by service name and carrier id.

    if !!service && service != self # second, we the check to see if there is already a service with the entered name and carrier.
      errors.add(:name, "is already an option with this carrier.") # if so, display our error message.
    end
  end

end
