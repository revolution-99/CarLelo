class Condition < ApplicationRecord
    validate :already_in_range?
    validate :range_end_greater_than_start
    validates :condition, presence: true, uniqueness: { case_sensitive: false }
    validates :price_start, presence: true, numericality: { only_integer: true }, uniqueness: true
    validates :price_end, presence: true, numericality: { only_integer: true }, uniqueness: true

    scope :in_range, ->(range) { where('price_end >= ?', range.first).where('price_start <= ?', range.last) }
    scope :exclude_self, ->(id) { where.not(id: id) }

    def already_in_range?
        if Condition.exclude_self(id).in_range(price_start..price_end).count.positive?
            errors.add(:base, 'Range is already alloted')
        end        
    end
    
    def range_end_greater_than_start
        if price_end < price_start
            errors.add(:base, 'Starting price should be less than ending price.')
        end
    end
end
