class Year < ApplicationRecord
    validates :begin, presence: true, numericality: { only_integer: true }
    validates :end, presence: true, numericality: { only_integer: true }
end
