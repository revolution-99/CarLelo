class UsersController < ApplicationController

    skip_before_action :require_login

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            # session[:user_id] = @user_id
            # @user.confirmation_token
            @user.save(validate: false)
            UserMailer.registration_confirmation(@user).deliver_now
            redirect_to login_path, notice: "A verification link is sent to your mail account"
        else
            render :new
        end
    end

    def confirm_email
        user = User.find_by_confirm_token(params[:token])
        if user
            user.email_activate 
            user.save(validate: false)
            redirect_to login_url, notice: "Welcome to CarLelo, PLease Log in to continue"
        else
            redirect_to root_url, notice: "Sorry. User does not exist"
        end
    end


    private
    def user_params
        params.require(:user).permit(:email, :first_name, :last_name, :mobile_no, :password, :password_confirmation, :is_admin, :is_buyer, :is_seller )
    end
end