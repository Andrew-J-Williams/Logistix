class Carrier < ApplicationRecord
    has_many :services
    has_many :shipments
    has_many :users, through: :shipments
end
