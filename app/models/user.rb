class User < ApplicationRecord
    before_save :confirmation_token
    
    has_many :cars
    has_many :appointments
    has_secure_password

    validates :email,
    presence: true,
    uniqueness: true,
    format:{with: /\A[\w.+-]+@\w+\.\w+\z/, message: "Invalid mail id. Please put a valid one."}

    validates :mobile_no, 
    presence: true, 
    uniqueness: true,
    format:{with: /\A\d{10}\z/, message: "Invalid Phone Number. Please put a valid one."}

    validates :first_name, presence: true
    validates :password, length: { in: 6..20 }, :if => :password

    def email_activate
        self.email_confirmed = true
        self.confirm_token = nil
        # save!(:validate => false)
    end
    
    # private
    def confirmation_token
        if self.confirm_token.blank?
            self.confirm_token = SecureRandom.urlsafe_base64.to_s
        end
    end
end
