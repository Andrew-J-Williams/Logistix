class User < ApplicationRecord
    has_many :shipments
    has_many :services, through: :shipments

    validates :email, uniqueness: true, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }
    validates :username, uniqueness: true, presence: true

    has_secure_password

    def self.generate_from_google_omni(auth)
        self.find_or_create_by(email: auth[:info][:email]) do |u|
            u.email = auth[:info][:email]
            u.password = SecureRandom.hex
        end
    end

end
