class AppointmentController < ApplicationController

    before_action :require_car_registration

    def new
        @appointment = Appointment.new
    end
    def create
        # @appointment = Appointment.new(appointment_date: params[:appointment_date], car_id: current_car.id, user_id: current_user.id)
        @appointment = Appointment.new(appointment_params)
        @appointment.user_id = current_user.id
        @appointment.car_id = current_car.id
        
        # @appointment.errors.full_messages
        if @appointment.save
            session[:appointment_id] = @appointment_id
            UserMailer.appointment_confirmation(current_user, @appointment).deliver_later
            # AppointmentNotification.message(current_user, current_car, appointment).deliver_later
            # redirect_to appointment_path, notice: "The best price for your car is here."
            redirect_to root_path, notice: "You will be notified about your appointment soon."

            
        else
            render :new
        end
        # mark_notifications_as_read
        # redirect_to root_path, notice: "You will be notified about your appointment soon."
    end
    
    def appointment_params
        params.require(:appointment).permit(:appointment_date)
    end

    def require_car_registration
        unless current_car
            redirect_to root_path, notice: "You must fill the car details for the appointment"
        end
    end
end
