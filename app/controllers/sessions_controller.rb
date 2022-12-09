class SessionsController < ApplicationController
    skip_before_action :require_login

    def new; end

    def destroy
        session[:user_id] = nil
        redirect_to login_path, notice: 'Log out Successfully. Visit again.'
    end

    def destroy_in_dashbaord
        session[:user_id] = nil
        redirect_to login_path, notice: 'Welcome back. Your Profile is updated successfully. Please login with your credentials to continue.'
    end

    def create
        user = User.find_by(email: params[:email].downcase)
        if user.present? && user.authenticate(params[:password]) && user.email_confirmed == true
            session[:user_id] = user.id
           if user.is_seller == true
            flash[:notice] = 'Logged in Successfully as a seller'
            redirect_back_or(seller_dashboard_path)
           elsif user.is_buyer == true
            flash[:notice] = 'Logged in Successfully as a buyer'
            redirect_back_or(buyer_dashboard_path)
           elsif user.is_admin == true
            flash[:notice] = 'Logged in Successfully as an admin'
            redirect_back_or(dashboard_path)
           end
        elsif user.present? && user.email_confirmed == false
            flash[:alert] = 'Please confirm your email to login.'
            render :new
        else
            flash[:alert] = 'Invalid email id or password'
            render :new
        end
    end
end
