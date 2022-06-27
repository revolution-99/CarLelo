class Car < ApplicationRecord
    belongs_to :user
    has_one :appointment
    validates :city, presence: true
    validates :brand, presence: true
    validates :model, presence: true
    validates :year, presence: true
    validates :variant, presence: true
    validates :state, presence: true
    validates :km, presence: true
    validates :mobile_no, presence: true, format:{with: /\A\d{10}\z/, message: "Invalid Phone Number. Please put a valid one."}

    scope :filter_by_city, -> (city){where city: city}
    scope :filter_by_year, -> (year){where year: year}
    scope :filter_by_km, -> (km){where km: km}
    scope :filter_by_brand, -> (brand){where brand: brand}
    scope :filter_by_model, -> (model){where model: model}
    scope :filter_by_state, -> (state){where state: state}
    scope :filter_by_variant, -> (variant){where variant: variant}
end
