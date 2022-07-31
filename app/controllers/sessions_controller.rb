class SessionsController < ApplicationController
    
    skip_before_action :require_login

    def new
        
    end

    def destroy
        session[:user_id] = nil
        redirect_to login_path, notice: "Log out Successfully. Visit again."
    end

    def destroy_in_dashbaord
        session[:user_id] = nil
        redirect_to login_path, notice:"Welcome back. Your Profile is updated successfully. Please login with your credentials to continue." 
    end

    def create
        user = User.find_by(email: params[:email])
        if user.present? && user.authenticate(params[:password]) && user.email_confirmed == true
            session[:user_id] = user.id
           if user.is_seller == true
            redirect_to seller_dashboard_path,notice: "Logged in Successfully as a seller"
           elsif user.is_buyer == true
            redirect_to buyer_dashboard_path,notice: "Logged in Successfully as a buyer"
           elsif user.is_admin == true
            redirect_to admin_dashboard_path,notice: "Logged in Successfully as an admin"
           end
        else
            flash[:alert] = "Invalid email id or password"
            render :new
        end
    end
end