class User < ApplicationRecord
    before_save :confirmation_token
    
    has_one :role
    has_secure_password

    validates :email,
    presence: true,
    uniqueness: true,
    format:{with: /\A[\w.+-]+@\w+\.\w+\z/, message: "Invalid mail id. Please put a valid one."}

    validates :first_name, presence: true
    validates :password, length: { in: 6..20 }

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
