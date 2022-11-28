class Kilometer < ApplicationRecord
    validate :already_in_range?
    validate :range_end_greater_than_start

    validates :name, presence: true, uniqueness: { case_sensitive: false }
    validates :km_start, presence: true, numericality: { only_integer: true }, uniqueness: true
    validates :km_end, presence: true, numericality: { only_integer: true }, uniqueness: true
    
    scope :in_range, ->(range) { where('km_end >= ?', range.first).where('km_start <= ?', range.last) }

    def already_in_range?
        if Kilometer.in_range(km_start..km_end).count.positive?
            errors.add(:base, 'Range is already alloted')
        end        
    end
    
    def range_end_greater_than_start
        if km_end < km_start
            errors.add(:base, 'Starting kilometer should be less than ending kilometer.')
        end
    end
end
