class Appointment < ApplicationRecord
    after_create :notify_create
    after_update :notify_update
    validate :one_directional_status
    # after_destroy :notify_update_delete
    validate :no_past_appointment_date
    belongs_to :user
    belongs_to :car

    enum status: {
        Pending_Approval: 0,
        Processing: 1,
        Investigating: 2,
        Ready_For_Sell: 3,
        Sold: 4,
        Sell_Request_Cancelled: 5,
        Rejected: 6
    }

    validates :appointment_date, presence: true
    scope :filter_by_status, ->(status) { where status: status }

    has_many :notifications, dependent: :destroy

    def no_past_appointment_date
        if appointment_date.present?
            if appointment_date < Time.zone.today
                errors.add(:appointment_date, 'can not be in the past')          
            end
        end
    end

    def notify_create
        Notification.create(user_id: user.id, car_id: car.id, appointment_id: id, action: 'booked')
    end

    def notify_update
        if saved_change_to_is_approved?
            if is_approved == true
                Notification.create(user_id: user.id, car_id: car.id, appointment_id: id, action: 'approved')
                UserMailer.appointment_status_approval(user, self).deliver_later
            elsif is_approved == false
                Notification.create(user_id: user.id, car_id: car.id, appointment_id: id, action: 'rejected')
            end
        elsif saved_change_to_status?
            Notification.create(user_id: user.id, car_id: car.id, appointment_id: id, action: 'status_changed')
            UserMailer.appointment_status_update(user, self).deliver_later
        elsif saved_change_to_appointment_date?
            Notification.create(user_id: user.id, car_id: car.id, appointment_id: id, action: 'rescheduled')
        end
    end
    
    def one_directional_status
        if Appointment.statuses[status] < Appointment.statuses[status_was]
            errors.add(:base, 'Previous status can not be selected.')
        end
    end
end
