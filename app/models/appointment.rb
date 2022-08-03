class Appointment < ApplicationRecord
    after_create :notify_user
    belongs_to :user
    belongs_to :car

    enum status:{
        Processing: 0,
        Investigating: 1,
        Sold: 2,
    }

    scope :filter_by_status, -> (status){where status: status}

    # has_many :notifications, through: :user, dependent: :destroy
    has_many :notifications, dependent: :destroy

    # before_destroy :cleanup_notifications
    # has_noticed_notifications model_name: "Notification"

    def notify_user
        # Notification.create!(recipient:user, actor:car, action:"booked", notifiable: self)
        Notification.create(user_id: user.id, car_id: car.id, appointment_id: id, action:"booked")
        # session[:car_id] = nil
    end

    # def cleanup_notification
    #     notifications_as_appointment.destroy_all
    # end
end