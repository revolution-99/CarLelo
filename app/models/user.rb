class User < ApplicationRecord
    before_save :confirmation_token
    has_many :cars, dependent: :destroy
    has_many :appointments, dependent: :destroy
    has_many :notifications, dependent: :destroy
    has_secure_password

    validates :email,
              presence: { message: 'Email can not be blank' },
              uniqueness: { case_sensitive: false, message: 'Sorry! This email has alredy been taken' },
              format: { with: /\A[\w.+-]+@\w+\.\w+\z/,
                        message: 'Invalid mail id. Please put a valid one.'
                      }

    validates :mobile_no,
              presence: { message: 'Mobile number can not be blank' },
              uniqueness: { scope: [:is_seller, :is_buyer], message: 'Sorry! This phone number has alredy been taken' },
              format: { with: /\A\d{10}\z/,
                        message: 'Invalid Phone Number. Please put a valid one.'
                      }

    validates :first_name, presence: { message: 'First name can not be blank' }

    validates :password,
              presence: { message: 'Password can not be blank' },
              length: { in: 6..20,
                        message: 'Password must be of minimum length 6 and maximum 20' }, if: :password

    validates :is_seller,
              presence: { message: 'Must choose a role of seller or buyer' }, unless: :is_buyer

    def email_activate
        self.email_confirmed = true
        self.confirm_token = nil
    end

    def confirmation_token
        return self.confirm_token = SecureRandom.urlsafe_base64.to_s if self.confirm_token.blank?
    end
end
