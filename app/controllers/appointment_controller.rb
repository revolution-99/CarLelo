class AppointmentController < ApplicationController

    def new
        @appointment = Appointment.new
    end
    def create
        # @appointment = Appointment.new(appointment_date: params[:appointment_date], car_id: current_car.id, user_id: current_user.id)
        @appointment = Appointment.new(appointment_params)
        @appointment.user_id = current_user.id
        @appointment.car_id = current_car.id
        if @appointment.save
            session[:appointment_id] = @appointment_id
            UserMailer.appointment_confirmation(current_user, @appointment).deliver_later
            # redirect_to appointment_path, notice: "The best price for your car is here."
            redirect_to root_path, notice: "You will be notified about your appointment soon."
        else
            render :new
        end
        # redirect_to root_path, notice: "You will be notified about your appointment soon."
    end
    
    def appointment_params
        params.require(:appointment).permit(:appointment_date)
    end
end
