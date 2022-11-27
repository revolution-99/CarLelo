class BuyerDashboardController < ApplicationController
    
    skip_before_action :require_login

    def index; end

    def show
        @car = Car.find_by(id: params[:id])
        @partial_to_render = params[:partial]
    end

    def appointments_list
        @appointments = current_user.appointments
        @appointments = @appointments.filter_by_status(params[:status]) if params[:status].present? 
    end

    def user_profile
        @user = current_user
    end

    def car_branches
      @maps = Map.all
    end

    def update
        @user = current_user
        redirect_to logout_path, notice: 'Welcome back. Your Profile is updated successfully. Please login with your credentials to continue.' if @user.update(update_params)
    end

    private
    def update_params
        params.require(:user).permit(:email, :mobile_no)
    end   
end
