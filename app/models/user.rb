class User < ApplicationRecord


    validates :email, presence: true, uniqueness: true
    validates :username, presence: true, uniqueness: true
    has_secure_password

    def admin_or_employee
        self.employee = true unless self.admin
        self.admin = false unless self.admin
    end

    def normalize_phone_number
        self.contact_number.phony_formatted!(normalize: :NL, format: :international )
    end
end
