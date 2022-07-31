module Admin
    class DashboardController < ApplicationController
        def new
        end

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