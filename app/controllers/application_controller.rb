class ApplicationController < ActionController::Base

    before_action :require_login
    # before_action :set_notifications, if: :current_user

    def current_user
        if session[:user_id]
            @current_user = User.find_by(id: session[:user_id])
        end
    end
    helper_method :current_user
    
    def current_car
        if session[:car_id]
            @current_car = Car.find_by(id: session[:car_id])
        end
    end
    helper_method :current_car

    def selected_car
        @selected_car = Car.find_by(id: params[:id])
    end
    helper_method :selected_car

    def current_appointment
        @current_appointment = Appointment.find_by(params[:id])
    end
    helper_method :current_appointment

    def require_login
        unless current_user
            redirect_to login_path, notice: "You must logged in first"
        end
    end
    # helper_method :logger

    def authorized_only_to_admin!
        redirect_to root_path unless  current_user.is_admin == true;
    end

end

