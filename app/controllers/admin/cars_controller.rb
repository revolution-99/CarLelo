module Admin
    class CarsController < ApplicationController

        before_action :authorized_only_to_admin!
        
        def create
            @car = current_user.cars.create(car_params)
            # @car.user_id = current_user.id
            if @car.save
                session[:car_id] = @car.id
                redirect_to admin_dashboards_car_appointments_path(@car.id), notice: "Schedule the appointment to create the car record."
            # else
            #     render :new
            end
        end

        def destroy
            @car = Car.find_by(id: params[:id])
            @car.destroy
            redirect_to admin_dashboards_path, notice: "Car record is destroyed successfully"
        end

        def show
            @current_car = Car.find_by(id: params[:id])
        end

        def update
            @car = Car.find_by(id: params[:id])
            if @car.update(car_params)
                redirect_to admin_dashboards_path, notice: "Your changes are upadted successully"
            end
        end
        
        private
        def car_params
            params.require(:car).permit(:city, :brand, :model, :year, :variant, :state, :km, :condition)
        end
    end
end

