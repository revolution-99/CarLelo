class Year < ApplicationRecord
    validates :name, presence: true, numericality: { only_integer: true }
end
