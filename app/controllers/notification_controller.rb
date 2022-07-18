class NotificationController < ApplicationController
    
    def index
        @notifications = current_user.notifications
        respond_to do |format|
            # format.html{}
            format.js 
        end
    end
end