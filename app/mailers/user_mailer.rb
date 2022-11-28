class UserMailer < ApplicationMailer
    def registration_confirmation(user)
        @user = user
        mail(:to => @user.email, :subject => 'Registration Confirmation')
    end

    def appointment_confirmation(user, appointment)
        @user = user
        @appointment = appointment
        @subject = "Appointment Confirmation for #{@user.first_name} #{@user.last_name} at #{@appointment.created_at}"
        mail(to: @user.email, subject: @subject)
    end

    def appointment_status_update(user, appointment)
        @user = user
        @appointment = appointment
        @subject = "Appointment Status Update for #{@user.first_name} #{@user.last_name} at #{@appointment.created_at}"
        mail(to: @user.email, subject: @subject)
    end

    def appointment_status_approval(user, appointment)
        @user = user
        @appointment = appointment
        @subject = "Appointment Status Approval for #{@user.first_name} #{@user.last_name} at #{@appointment.created_at}"
        mail(to: @user.email, subject: @subject)
    end
end
