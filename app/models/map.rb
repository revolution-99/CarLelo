class Map < ApplicationRecord
    geocoded_by :address
    # reverse_geocoded_by :latitude, :longitude, address: :loc
    after_validation :geocode
end
