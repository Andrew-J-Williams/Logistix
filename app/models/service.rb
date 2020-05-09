class Service < ApplicationRecord
  belongs_to :carrier
  has_many :shipments
  has_many :users, through: :shipments

  accepts_nested_attributes_for :carrier
end
