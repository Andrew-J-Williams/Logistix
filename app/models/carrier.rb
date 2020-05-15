class Carrier < ApplicationRecord
    has_many :services

    validates :name, uniqueness: true 
    validates :phone, uniqueness: true 
end
