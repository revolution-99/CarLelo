class SellUsedCarController < ApplicationController
    # skip_before_action :require_login
    protect_from_forgery except: :edit
    def new
        @car = Car.new
    end

    def create
        @car = Car.new(car_params)
        if @car.save
            session[:car_id] = @car_id
            redirect_to appointment_path, notice: "The best price for your car is here."
        else
            render :new
        end
    end

    # def edit

    # end
    def car_params
        params.require(:car).permit(:city, :brand, :model, :year, :variant, :state, :km, :mobile_no)
    end

end