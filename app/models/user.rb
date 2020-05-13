class User < ApplicationRecord
    has_many :shipments
    has_many :services, through: :shipments

    validates :email, uniqueness: true, presence: true
    validates :username, uniqueness: true, presence: true
    validates :password, presence: true, length: {within: 6..30, message: "Password must have at least 6 characters"}

    has_secure_password
end
