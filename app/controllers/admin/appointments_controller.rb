module Admin
    class AppointmentsController < ApplicationController
        before_action :authorized_only_to_admin!
        
        def create
            @appointment = Appointment.new(appointments_params)
            @appointment.user_id = current_user.id
            @appointment.car_id = current_car.id
            if @appointment.save
                session[:appointment_id] = @appointment_id
                redirect_to admin_dashboards_path, notice: 'One appointment record is created successfully.'
            end
        end

        def delete
            @appointment = Appointment.find_by(id: params[:id])
            @appointment.is_approved = false
            @appointment.destroy
            redirect_to root_path, notice: 'Appointment record is destroyed successfully'
        end

        def update
            # @car = Car.find_by(id: params[:car_id])
            @appointment = Appointment.find_by(id: params[:id])
            # @appointment.car_id = @car.id

            if @appointment.update!(appointment_params)
                redirect_to admin_dashboards_path, notice: 'Your changes are upadted successully'
            else
                redirect_to root_path
            end
        end

        private
        def appointment_params
            params.require(:@appointment).permit(:status, :is_approved, :appointment_date)
        end

        def appointments_params
            params.permit(:status, :is_approved, :appointment_date)
        end
    end
end
