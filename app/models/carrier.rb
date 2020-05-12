class Carrier < ApplicationRecord
    has_many :services

    validates :name, presence: true
    validates :phone, presence: true
end
