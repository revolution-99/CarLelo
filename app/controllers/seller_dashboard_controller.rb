class SellerDashboardController < ApplicationController
    
    skip_before_action :require_login

    # before_action :verify_password, only: [:update]
    # before_action :validate_email, only: [:update]

    def new
        
    end

    def edit
        @user = current_user
        @cars = @user.cars
        @appointments = @user.appointments
        # @appointments = Appointment.all.includes(:user)
        @partial_to_render = params[:partial]
        respond_to do |format|
            # format.html{}
            format.js 
        end
        # For the filter option of My appointments
        # @appnmts = Appointment.where(nil)
        @appointments = @appointments.filter_by_status(params[:status]) if params[:status].present?
    end


    def update
        @user = current_user
        # @user.update_attribute(:first_name, "Sanu")
        # @user.update_attribute(:last_name, "Chand")
        if @user.update(update_params)
            redirect_to logout_path, notice:"Welcome back. Your Profile is updated successfully. Please login with your credentials to continue."
        end
    end

    # def filter
    #     @partial_to_render = params[:partial]
    #     @appointments = Appointment.where(nil)
    #     @appointments = @appointments.filter_by_status(params[:status]) if params[:status].present?
    # end
    
    private
    def update_params
        params.require(:user).permit(:email, :mobile_no)
    end

    private
    def validate_email
        @new_email = params[:email]
        if @new_email == current_user.email
            flash[:alert] = "Current Email and new email can't be same"
        end
    end

    # def verify_password
    #     redirect_to verification_path, notice: "You must logged in first"
    # end
end