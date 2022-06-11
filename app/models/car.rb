class Car < ApplicationRecord
    validates :city, presence: true
    validates :brand, presence: true
    validates :model, presence: true
    validates :year, presence: true
    validates :variant, presence: true
    validates :state, presence: true
    validates :km, presence: true
    # validates :mobile_no, presence: true, format:{with: /\A\d{10}\z/, message: "Invalid Phone Number. Please put a valid one."}
end
