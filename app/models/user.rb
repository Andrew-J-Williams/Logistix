class User < ApplicationRecord
    has_many :customers
    has_many :shipments
    has_many :carriers, through: :shipments
end
