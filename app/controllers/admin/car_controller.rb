module Admin
    class CarController < ApplicationController

        before_action :authorized_only_to_admin!
        
        def create
            @car = current_user.cars.create(car_params)
            # @car.user_id = current_user.id
            if @car.save
                session[:car_id] = @car.id
                redirect_to admin_dashboard_path, notice: "A new record of car has been created successfully"
            else
                render :new
            end
        end

        def delete
            @car = Car.find_by(id: params[:id])
            @car.destroy
            redirect_to admin_dashboard_path, notice: "Car record is destroyed successfully"
        end

        def show
            @current_car = Car.find_by(id: params[:id])
        end

        def update
            @car = Car.find_by(id: params[:id])
            if @car.update!(car_params)
                redirect_to admin_dashboard_path, notice: "Your changes are upadted successully"
            end
        end
        
        private
        def car_params
            params.require(:car).permit(:city, :brand, :model, :year, :variant, :state, :km)
        end
    end
end
