class Carrier < ApplicationRecord
    has_many :services

    validates :name, presence: true, uniqueness: true
    validates :phone, presence: true, uniqueness: true

    scope :find_carrier, -> (query){ where('name LIKE ?', "%#{query}%") } # Our find_carrier scope method accepts the argument of the query provided by the user.
    # The 'where' method will check and see if the user has entered a value that comes close to matching a carrier name.
    # The 'LIKE' condition will search for all names that have the query text.
    # The '?' acts as a placeholder for interpolating query values.
end
