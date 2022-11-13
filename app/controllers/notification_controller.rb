class NotificationController < ApplicationController
    def index
        @notifications = current_user.notifications.order('notifications.created_at DESC')
        respond_to do |format|
            # format.html{}
            format.js
        end
        # @car = Car.find_by(id: params[:id])
        # @condition = Condition.where(condition: @car.condition).joins("INNER JOIN cars ON cars.condition = conditions.condition INNER JOIN Notifications ON cars.id = notificatins.car_id").first
    end
end
