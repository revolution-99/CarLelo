module Admin
    class DashboardsController < ApplicationController
        
        before_action :authorized_only_to_admin!
        
        def show; end

        def edit
            @partial_to_render = params[:partial]
            @cars = Car.all
            @car = Car.new
            # @appointment = Appointment.new
            # @appointment = current_appointment
            @appointments = Appointment.all
            respond_to do |format|
                # format.html{},
                format.js 
            end
        end
    end
end
