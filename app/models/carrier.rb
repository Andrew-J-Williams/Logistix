class Carrier < ApplicationRecord
    has_many :shipments
    has_many :users, through: :shipments
end
