class Notification < ApplicationRecord
  # belongs_to :recipient, class_name: "User"
  # belongs_to :actor, class_name: "Car"
  # belongs_to :notifiable, polymorphic: true

  belongs_to :user
  belongs_to :car
  belongs_to :appointment
end
