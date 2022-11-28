class User < ApplicationRecord
    before_save :confirmation_token
    has_many :cars, dependent: :destroy
    has_many :appointments, dependent: :destroy
    has_many :notifications, dependent: :destroy
    has_secure_password

    validates :email, presence: true, uniqueness: { case_sensitive: false }, format: { with: /\A[\w.+-]+@\w+\.\w+\z/ }

    validates :mobile_no, 
              presence: true,
              numericality: { only_integer: true },
              uniqueness: { scope: %i[is_seller is_buyer] },
              format: { with: /\A\d{10}\z/ }

    validates :first_name, presence: true
    validates :password, presence: true, length: { in: 6..20 }, if: :password

    def email_activate
        self.email_confirmed = true
        self.confirm_token = nil
    end

    def confirmation_token
        return self.confirm_token = SecureRandom.urlsafe_base64.to_s if self.confirm_token.blank?
    end
end
