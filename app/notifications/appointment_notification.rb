# To deliver this notification:
#
# AppointmentNotification.with(post: @post).deliver_later(current_user)
# AppointmentNotification.with(post: @post).deliver(current_user)

class AppointmentNotification < Noticed::Base
  # Add your delivery methods
  #
  deliver_by :database, debug: true
  # deliver_by :email, mailer: "UserMailer"
  # deliver_by :slack
  # deliver_by :custom, class: "MyDeliveryMethod"

  # def to_database
  #   {
  #     type: self.class.name,
  #     params: params
  #     # account: Current.account
  #   }
  # end

  # Add required params
  #
  # param :post

  # Define helper methods to make rendering easier.
  #
  def message
    @appointment = Appointment.find_by(params[:appointment_id])
    @car = Car.find_by(params[:car_id])
    @user = User.find(@appointment.user_id)
    t(".message", user: @user.email)
    # This will look for the translation of en.notifications.appoointment_notification
    # @user = User.find_by(email: params[:email])
    # @appointment = Appointment.find_by(params[:appointment_id])
    # @car = Car.find(@appointment.car_id)


    # @appointment = Appointment.find_by(params[:appointment_id])
    # @car = Car.find_by(params[:car_id])
    # @user = User.find(@appointment.user_id)
    # "#{@user.first_name}, Your appointment is booked with appointment id :#{@car.id} on #{@appointment.appointment_date} and #{@car.city}"
  end
  #
  def url
    root_path
  end
end
