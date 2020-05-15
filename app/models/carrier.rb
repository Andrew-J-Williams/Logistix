class Carrier < ApplicationRecord
    has_many :services

    validates :name, presence: true, uniqueness: true
    validates :phone, presence: true, uniqueness: true

    validate :user_choice

    def user_choice
        
    end
end
