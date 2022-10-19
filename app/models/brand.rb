class Brand < ApplicationRecord
    has_many :models, dependent: :destroy
    
    validates :name,
    presence: { message: 'Brand name can not be blank' },
    uniqueness: { case_sensitive: false, message: 'Sorry! This brand alredy exist in the database.' }
end
