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
            @user.save
            UserMailer.registration_confirmation(@user).deliver_now
            redirect_to login_path, notice: 'A verification link is sent to your mail account. Verify your account on clicking the link.'
        else
            render :new
        end
    end

    def show
        @user = current_user
    end

    def update
        @user = current_user
        if @user.update(user_params)
            redirect_to root_path, notice: 'Your changes are upadted successully'
        else
            render :show
        end
    end

    def confirm_email
        user = User.find_by(confirm_token: params[:token])
        if user
            user.email_activate
            user.save(validate: false)
            redirect_to login_url, notice: 'Welcome to CarLelo, Your email has been confirmed successfully. PLease Log in to continue'
        else
            redirect_to root_url, notice: 'Sorry. User does not exist'
        end
    end

    private
    def user_params
        params.require(:user).permit(:email, :first_name, :last_name, :mobile_no, :password, :password_confirmation, :is_admin, :is_buyer, :is_seller)
    end
end
