class Year < ApplicationRecord
    validates :begin, presence: true, uniqueness: { case_sensitive: false }, numericality: { only_integer: true }
    validates :end, presence: true, uniqueness: { case_sensitive: false }, numericality: { only_integer: true }
end
