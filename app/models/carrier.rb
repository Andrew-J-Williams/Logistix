class Carrier < ApplicationRecord
    has_many :services

    validates :name, presence: true, uniqueness: true
    validates :phone, presence: true, uniqueness: true

end
