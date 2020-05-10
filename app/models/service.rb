class Service < ApplicationRecord
  belongs_to :carrier
  has_many :shipments
  has_many :users, through: :shipments

  accepts_nested_attributes_for :carrier

  def self.sort_service
    order(:name)
  end

  def name_and_carrier
    "#{name} - #{carrier.try(:name)}"
  end

end
