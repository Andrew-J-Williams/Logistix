class User < ApplicationRecord
    has_many :customers
    has_many :shipments
    has_many :carriers, through: :shipments

    validates :email, uniqueness: true, presence: true
    validates :username, uniqueness: true, presence: true

    has_secure_password

end
