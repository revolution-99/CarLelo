class UserMailer < ApplicationMailer

    def registration_confirmation(user)
        @user = user
        # @token = @user.signed_id(purpose: "email_confirmation", expires_in: 15.minutes)
        mail(:to => @user.email, :subject => "Registration Confirmation")
    end
end
