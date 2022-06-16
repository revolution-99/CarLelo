class AppointmentController < ApplicationController

    def new
        @appointment = Appointment.new
    end
    def create
        @appointment = Appointment.new(appointment_date: params[:appointment_date], user_id: current_user.id)
        if @appointment.save
            session[:appointment_id] = @appointment_id
            UserMailer.appointment_confirmation(current_user,@appointment).deliver_later
            # redirect_to appointment_path, notice: "The best price for your car is here."
            redirect_to root_path, notice: "You will be notified about your appointment soon."
        else
            render :new
        end
        # redirect_to root_path, notice: "You will be notified about your appointment soon."
    end
end
