class Car < ApplicationRecord
    searchkick word_middle: [:city, :year, :km, :brand, :model, :state, :variant]	
    Car.reindex
    # include Elasticsearch::Model
    # include Elasticsearch::Model::Callbacks

    belongs_to :user
    has_many :appointments, dependent: :destroy
    has_many :notifications, dependent: :destroy

    validates :city, presence: true
    validates :brand, presence: true
    validates :model, presence: true
    validates :year, presence: true
    validates :variant, presence: true
    validates :state, presence: true
    validates :km, presence: true
    validates :condition, presence: true

    scope :filter_by_city, ->(city) { where city: city }
    scope :filter_by_year, ->(year) { where year: year }
    scope :filter_by_km, ->(km) { where km: km }
    scope :filter_by_brand, ->(brand) { where brand: brand }
    scope :filter_by_model, ->(model) { where model: model }
    scope :filter_by_state, ->(state) { where state: state }
    scope :filter_by_variant, ->(variant) { where variant: variant }
end
