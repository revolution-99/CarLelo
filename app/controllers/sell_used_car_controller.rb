class SellUsedCarController < ApplicationController
    # protect_from_forgery except: :edit
    
    def new
        @car = Car.new
    end

    def create
        @car = current_user.cars.create(car_params)
        # @car.user_id = current_user.id
        if @car.save
            session[:car_id] = @car.id
            redirect_to appointment_path, notice: "The best price for your car is here."
        else
            render :new
        end
    end

    def car_params
        params.require(:car).permit(:city, :brand, :model, :year, :variant, :state, :km)
    end

end