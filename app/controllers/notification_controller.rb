class NotificationController < ApplicationController
    
    def index
        @notifications = current_user.notifications
        # @carr = Car.find_by(id: params[:id])
        
        respond_to do |format|
            # format.html{}
            format.js 
        end
    end
end