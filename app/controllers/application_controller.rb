class ApplicationController < ActionController::Base
    before_action :require_login
    # before_action :set_notifications, if: :current_user

    def current_user
        @current_user = User.find_by(id: session[:user_id]) if session[:user_id]
    end
    helper_method :current_user
    
    def current_car
        @current_car = Car.find_by(id: session[:car_id]) if session[:car_id]
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
        redirect_to login_path, notice: 'You must logged in first' unless current_user
    end
    # helper_method :logger

    def authorized_only_to_admin!
        unless current_user and current_user.is_admin 
            redirect_to root_path, notice: 'This feature can be unlocked with admin access. Please Log in as Admin to continue'
        end
    end

    def get_brand(model)
        Brand.find(model.brand_id)
    end
    helper_method :get_brand

    def count_models(obj)
        obj.count
    end
    helper_method :count_models
end
