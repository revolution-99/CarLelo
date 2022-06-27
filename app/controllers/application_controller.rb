class ApplicationController < ActionController::Base

    # before_action :require_login

    def current_user
        if session[:user_id]
            @current_user = User.find_by(id: session[:user_id])
        end
    end
    helper_method :current_user
    
    def current_car
        @current_car = Car.find_by(params[:id])
    end
    helper_method :current_car

    def current_appointment
        @current_appointment = Appointment.find_by(params[:id])
    end
    helper_method :current_appointment

    # def require_login
    #     unless current_user
    #         redirect_to login_path, notice: "You must logged in first"
    #     end
    # end
    # helper_method :logger
end
