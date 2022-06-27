class Appointment < ApplicationRecord
    belongs_to :user
    belongs_to :car

    enum status:{
        Processing: 0,
        Investigating: 1,
        Sold: 2,
    }
end