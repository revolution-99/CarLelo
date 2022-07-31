module Admin
    class AppointmentController < ApplicationController
        def create
            @appointment = Appointment.new(appointment_params)
            @appointment.user_id = current_user.id
            # @appointment.car_id = current_car.id
            
            if @appointment.save
                session[:appointment_id] = @appointment_id
                redirect_to admin_dashboard_path, notice: "One appointment record is created."
            end
        end

        def delete
            @appointment = Appointment.find_by(id: params[:id])
            @appointment.destroy
            redirect_to root_path, notice: "Appointment record is destroyed successfully"
        end

        def update
            @appointment = Appointment.find_by(id: params[:id])
            # @appointment.user_id = current_user.id
            # @appointment.car_id = current_car.id
            if @appointment.update!(appointment_params)
                redirect_to admin_dashboard_path, notice: "Your changes are upadted successully"
            else
                redirect_to root_path
            end
        end

        private
        def appointment_params
            params.require(:@appointment).permit(:status, :is_approved, :appointment_date)
        end

    end

end
