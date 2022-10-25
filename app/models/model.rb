class Model < ApplicationRecord
    belongs_to :brand, dependent: :destroy
    
    validates :name, presence: true, uniqueness: { case_sensitive: false }
end
