class SellUsedCarController < ApplicationController
    # skip_before_action :require_login
    # protect_from_forgery except: :edit
    before_action :require_login
    
    def new
        @car = Car.new
    end

    def create
        @car = current_user.cars.create(car_params)
        # @car.user_id = current_user.id
        if @car.save
            # session[:car_id] = @car_id
            redirect_to appointment_path, notice: "The best price for your car is here."
        else
            render :new
        end
    end

    # def index

    # end

    def car_params
        params.require(:car).permit(:city, :brand, :model, :year, :variant, :state, :km, :mobile_no)
    end

    def require_login
        unless current_user
            redirect_to login_path, notice: "You must logged in first"
        end
    end
end