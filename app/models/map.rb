class Map < ApplicationRecord
    validates :address, presence: true
    validates :latitude, presence: true, numericality: true, uniqueness: true
    validates :longitude, presence: true, numericality: true, uniqueness: true
end
