class BuyerDashboardController < ApplicationController
    
    skip_before_action :require_login

    def new
        
    end

    def edit
        @user = current_user
        @cars = @user.cars
        @appointments = @user.appointments
        @partial_to_render = params[:partial]
        respond_to do |format|
            # format.html{}
            format.js 
        end
        @appointments = @appointments.filter_by_status(params[:status]) if params[:status].present? 
    end

    def update
        @user = current_user
        # @user.update_attribute(:first_name, "Sanu")
        if @user.update(update_params)
            redirect_to logout_path, notice:"Welcome back. Your Profile is updated successfully. Please login with your credentials to continue."
        end
    end

    private
    def update_params
        params.require(:user).permit(:email, :mobile_no)
    end         
end