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

        def edit
            @appointment = Appointment.find_by(id: params[:id])
            unless @appointment.is_approved
                redirect_to admin_dashboards_appointments_path, alert: 'Please approve the appointment to edit it.'
            end
            if @appointment.status == 'Sold'
                redirect_to admin_dashboards_appointments_path, alert: 'Car is already sold.'
            end
        end

        def index
            @appointments = Appointment.all
        end

        def show
            @car = Car.find_by(id: params[:id])
        end

        def display
            @user = User.find_by(id: params[:id])
        end

        def destroy
            @appointment = Appointment.find_by(id: params[:id])
            @appointment.is_approved = false
            @appointment.destroy
            redirect_to admin_dashboards_path, notice: 'Appointment record is destroyed successfully'
        end

        def update
            # @car = Car.find_by(id: params[:car_id])
            @appointment = Appointment.find_by(id: params[:id])
            # @appointment.car_id = @car.id
            if @appointment.update!(appointment_params)
                redirect_to admin_dashboards_appointments_path, notice: 'Your changes are upadted successully'
            else
                redirect_to admin_dashboards_path, alert: 'Failed to update the appointment record'
            end
        end

        def approve
            @appointment = Appointment.find(params[:id])
            if @appointment.is_approved == true
                redirect_to admin_dashboards_appointments_path, alert: 'Appointment is already approved.'
            else
                @appointment.is_approved = true
                @appointment.status = 1
                if @appointment.update(appointments_approval_params)
                    redirect_to admin_dashboards_appointments_path, notice: 'Appointment is approved.'
                else
                    redirect_to admin_dashboards_path, alert: 'Failed to approve the appointment'
                end
            end
        end

        def buyers_list
            @appointments = Appointment.where(car_id: params[:id])
        end
        
        private
        def appointment_params
            params.require(:appointment).permit(:status, :appointment_date)
        end

        def appointments_approval_params
            params.permit(:is_approved)
        end
    end
end
