class Notification < ApplicationRecord
  belongs_to :user
  belongs_to :car
  belongs_to :appointment
end
