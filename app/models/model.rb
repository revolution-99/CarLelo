class Model < ApplicationRecord
    belongs_to :brand, dependent: :destroy
    
    validates :name,
    presence: { message: 'Model name can not be blank' },
    uniqueness: { case_sensitive: false, message: 'Sorry! This car model alredy exist in the database.' }
end
