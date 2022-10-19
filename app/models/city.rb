class City < ApplicationRecord
    validates :name,
    presence: { message: 'City name can not be blank' },
    uniqueness: { case_sensitive: false, message: 'Sorry! This city alredy exist in the database.' }
end
