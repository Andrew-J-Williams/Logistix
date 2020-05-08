class Service < ApplicationRecord
  belongs_to :carrier

  accepts_nested_attributes_for :carrier
end
