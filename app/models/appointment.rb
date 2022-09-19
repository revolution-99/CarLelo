class Appointment < ApplicationRecord
    after_create :notify_create
    after_update :notify_update
    # after_destroy :notify_update_delete
    belongs_to :user
    belongs_to :car

    enum status: {
        Processing: 0,
        Investigating: 1,
        Sold: 2
    }

    validates :appointment_date, presence: true
    scope :filter_by_status, ->(status) { where status: status }

    has_many :notifications, dependent: :destroy

    def notify_create
        Notification.create(user_id: user.id, car_id: car.id, appointment_id: id, action: 'booked')
    end

    def notify_update
        if saved_change_to_is_approved?
            if is_approved == true
                Notification.create(user_id: user.id, car_id: car.id, appointment_id: id, action: 'approved')
            end
        else
            if saved_change_to_status?
                Notification.create(user_id: user.id, car_id: car.id, appointment_id: id, action: 'status_changed')
                UserMailer.appointment_status_update(user, self).deliver_later
            elsif saved_change_to_appointment_date?
                Notification.create(user_id: user.id, car_id: car.id, appointment_id: id, action: 'rescheduled')
            end
        end
    end
end
