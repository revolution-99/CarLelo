class AppointmentController < ApplicationController
    before_action :require_login

    def new
        
    end
    def create
        redirect_to root_path, notice: "You will be notified about your appointment soon."
    end

    def require_login
        unless current_user
            redirect_to login_path, notice: "You must logged in first"
        end
    end
end
