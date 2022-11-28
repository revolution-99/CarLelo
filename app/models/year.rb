class Year < ApplicationRecord
    validates :name, presence: true, uniqueness: true, numericality: { only_integer: true }
end
