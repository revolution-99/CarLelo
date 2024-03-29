class Kilometer < ApplicationRecord
    validate :already_in_range?
    validate :range_end_greater_than_start

    validates :name, presence: true, uniqueness: { case_sensitive: false }
    validates :km_start, presence: true, numericality: { only_integer: true }
    validates :km_end, presence: true, numericality: { only_integer: true }
    
    scope :in_range, ->(range) { where('km_end >= ?', range.first).where('km_start <= ?', range.last) }
    scope :exclude_self, ->(id) { where.not(id: id) }

    def already_in_range?
        if Kilometer.exclude_self(id).in_range(km_start..km_end).count.positive?
            errors.add(:base, 'Range is already alloted')
        end        
    end
    
    def range_end_greater_than_start
        if km_end < km_start
            errors.add(:base, 'Starting kilometer should be less than ending kilometer.')
        end
    end
end
