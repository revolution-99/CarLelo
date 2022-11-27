class AppointmentsController < ApplicationController
    before_action :require_car_registration

    def new
        @appointment = Appointment.new
    end

    def create
        # @appointment = Appointment.new(appointment_date: params[:appointment_date], car_id: current_car.id, user_id: current_user.id)
        @appointment = Appointment.create(appointment_params)
        @appointment.user_id = current_user.id
        @car = Car.find(params[:car_id])
        # @car = Car.find(params[:car_id])
        @appointment.car_id = @car.id
        # @appointment.car_id = current_car.id
        if @appointment.save
            session[:appointment_id] = @appointment_id
            UserMailer.appointment_confirmation(current_user, @appointment).deliver_later
            if current_user.is_seller  
                redirect_to seller_dashboard_appointments_list_path, notice: "Congratulations! Your appointment is booked. You will be notified about your appointment's status soon."
            elsif current_user.is_buyer
                redirect_to buyer_dashboard_appointments_list_path, notice: "Congratulations! Your appointment is booked. You will be notified about your appointment's status soon."
            end
        else
            render :new
        end
    end
    
    def appointment_params
        params.require(:appointment).permit(:appointment_date, :status, :is_approved)
    end

    def require_car_registration
        if current_user.is_seller
            redirect_to root_path, notice: 'A seller must fill the car details for the appointment' unless current_car
        end
    end
end
