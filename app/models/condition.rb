class Condition < ApplicationRecord
    validate :already_in_range?
    validate :range_end_greater_than_start
    validates :condition, presence: true, uniqueness: { case_sensitive: false }
    validates :price_start, presence: true, numericality: { only_integer: true }, uniqueness: true
    validates :price_end, presence: true, numericality: { only_integer: true }, uniqueness: true

    scope :in_range, ->(range) { where("price_end >= ?", range.first).where("price_start <= ?", range.last) }

    def already_in_range?
        if Condition.in_range(price_start..price_end).count > 0
        # if Condition.pluck(:price_start, :price_end).any? { |min, max| (min..max).overlaps?(price_start..price_end) }
            errors.add(:base, 'Range is already alloted')
        end        
    end
    
    def range_end_greater_than_start
        if price_end < price_start
            errors.add(:base, 'Starting price should be less than ending price.')
        end
    end
end
