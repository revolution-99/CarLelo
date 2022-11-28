module Admin
    class AppointmentsController < ApplicationController
        before_action :authorized_only_to_admin!
        helper_method :sort_column, :sort_direction, :filter_status

        def create
            @appointment = Appointment.new(appointments_params)
            @appointment.user_id = current_user.id
            @appointment.car_id = current_car.id
            if @appointment.save
                session[:appointment_id] = @appointment_id
                redirect_to dashboard_path, notice: 'One appointment record is created successfully.'
            end
        end

        def edit
            @appointment = Appointment.find_by(id: params[:id])
            unless @appointment.is_approved
                redirect_to dashboard_appointments_path, alert: 'Please approve the appointment to edit it.'
            end
            if @appointment.status == 'Sold'
                redirect_to dashboard_appointments_path, alert: 'Car is already sold.'
            end
        end

        def index
            @appointments = Appointment.order(Arel.sql("#{sort_column} #{sort_direction}"))
            if params[:sort] == 'first_name' || params[:sort] == 'is_seller'
                @appointments = Appointment.joins(:user).order("#{params[:sort]} #{sort_direction}")
            elsif params[:sort] == 'brand' || params[:sort] == 'model'
                @appointments = Appointment.joins(:car).order("brand #{sort_direction}")
            end
            if params[:status].present?
                @appointments = Appointment.order(Arel.sql("#{sort_column} #{sort_direction}")).where(status: params[:status])
                if params[:sort] == 'first_name' || params[:sort] == 'is_seller'
                    @appointments = Appointment.joins(:user).order("#{params[:sort]} #{sort_direction}").where(status: params[:status])
                elsif params[:sort] == 'brand' || params[:sort] == 'model'
                    @appointments = Appointment.joins(:car).order("brand #{sort_direction}").where(status: params[:status])
                end
            end
        end

        def show
            @car = Car.find_by(id: params[:id])
            # @condition = Condition.where(condition: @car.condition).joins("INNER JOIN cars ON cars.condition = conditions.condition").first
        end

        def display
            @user = User.find_by(id: params[:id])
        end

        def destroy
            @appointment = Appointment.find_by(id: params[:id])
            @appointment.is_approved = false
            @appointment.destroy
            redirect_to dashboard_path, notice: 'Appointment record is destroyed successfully'
        end

        def update
            # @car = Car.find_by(id: params[:car_id])
            @appointment = Appointment.find_by(id: params[:id])
            # @appointment.car_id = @car.id
            if @appointment.update(appointment_params)
                redirect_to dashboard_appointments_path, notice: 'Your changes are updated successully'
            else
                render :edit
            end
        end

        def approve
            @appointment = Appointment.find(params[:id])
            @appointment.is_approved = true
            @appointment.status = 1
            if @appointment.update(appointments_approval_params)
                redirect_to dashboard_appointments_path, notice: 'Appointment is approved.'
            else
                redirect_to dashboard_path, alert: 'Failed to approve the appointment'
            end
        end

        def reject
            @appointment = Appointment.find(params[:id])
            # @appointment.is_approved = false
            @appointment.status = 6
            if @appointment.update(appointments_approval_params)
                redirect_to dashboard_appointments_path, notice: 'Appointment is rejected.'
            end
        end

        def buyers_list
            @appointments = Appointment.where(car_id: params[:id]).where(is_approved: true)
        end
        
        def sold_update
            @appointment = Appointment.find_by(id: params[:id])
            @appointments =Appointment.joins(:user).where("is_buyer=true").where(car_id: @appointment.car_id).where.not(id: params[:id])
            @seller_appointment = Appointment.where(car_id: @appointment.car_id).joins(:user).where('is_seller=true')[0]
            @appointments.each do|app|
                app.status = 5
                app.update(appointments_status_params)
            end
            @appointment.status = 4
            @seller_appointment.status = 4
            @appointment.update(appointments_status_params)
            @seller_appointment.update(appointments_status_params)
            redirect_to dashboard_appointments_path, notice: 'Your changes are updated successully'
        end

        private
        def appointment_params
            params.require(:appointment).permit(:status, :appointment_date)
        end

        private
        def appointments_approval_params
            params.permit(:is_approved)
        end

        private
        def appointments_status_params
            params.permit(:status)
        end

        private

        def sort_column
            params[:sort] || "status"
        end

        def sort_direction
            %w[asc desc].include?(params[:direction]) ? params[:direction] : 'asc'
        end

        def sort_direction
            %w[asc desc].include?(params[:direction]) ? params[:direction] : 'asc'
        end

        def filter_status
            params[:status] || ""
        end 
    end
end
