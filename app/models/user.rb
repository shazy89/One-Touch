class User < ApplicationRecord
    has_many :products
    has_many :tables

    validates :email, presence: true, uniqueness: true
    validates :username, presence: true, uniqueness: true
    validates :contact_number, presence: true

    has_secure_password



    def admin_or_employee
        self.employee = true unless self.admin
        self.admin = false unless self.admin
    end

    def normalize_phone_number
        if self.contact_number != nil
        self.contact_number.phony_formatted!(normalize: :US, format: :international ) 
        end
    end

      def self.find_or_create_from_omniauth(user_info)
        #binding.pry
       User.find_or_create_by(uid: user_info["uid"]) do |user|
          user.username = user_info["info"]["nickname"]
          user.password = SecureRandom.hex
          user.email = user_info["info"]["email"] 
          user.contact_number = "1111231212"
      end
    end

end



     

    