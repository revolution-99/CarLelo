class Condition < ApplicationRecord
    validates :condition, presence: true, uniqueness: { case_sensitive: false }
    validates :cost, presence: true, uniqueness: { case_sensitive: false }
end
