class NotificationController < ApplicationController
    def index
        @notifications = current_user.notifications.order('notifications.created_at DESC')
        respond_to do |format|
            # format.html{}
            format.js
        end
    end
end
