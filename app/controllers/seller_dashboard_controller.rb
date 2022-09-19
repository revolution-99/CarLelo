class SellerDashboardController < ApplicationController
    skip_before_action :require_login

    def new; end

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
        redirect_to logout_path, notice: 'Welcome back. Your Profile is updated successfully. Please login with your credentials to continue.' if @user.update(update_params)
    end
    
    private
    def update_params
        params.require(:user).permit(:email, :mobile_no)
    end

    def validate_email
        @new_email = params[:email]
        flash[:alert] = 'Current Email and new email can not be same' if @new_email == current_user.email
    end
end
