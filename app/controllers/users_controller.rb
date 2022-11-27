class UsersController < ApplicationController
    skip_before_action :require_login
    before_action :authorized_only_to_admin!, only: [:index, :destroy, :admin_upgradation ]

    def new
        @user = User.new
    end

    def index
        @users = User.all
    end

    def create
        @user = User.new(user_params)
        if @user.save
            # session[:user_id] = @user_id
            # @user.confirmation_token
            # @user.save
            UserMailer.registration_confirmation(@user).deliver_now
            redirect_to login_path, notice: 'A verification link is sent to your mail account. Verify your account on clicking the link.'
        else
            render :new
        end
    end

    def show
        @user = current_user
    end

    def destroy
        @user = User.find(params[:id])
        @user.destroy
        redirect_to dashboard_path, notice: 'User record is destroyed successfully.'
    end

    def update
        @user = current_user
        if @user.update(user_params)
            if @user.is_buyer
                redirect_to buyer_dashboard_user_profile_path, notice: 'Your changes are upadted successfully.'
            elsif @user.is_seller
                redirect_to seller_dashboard_user_profile_path, notice: 'Your changes are upadted successfully.'
            end
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

    def admin_upgradation
        @user = User.find(params[:id])
        @user.is_seller = false
        @user.is_buyer = false
        @user.is_admin = true
        if @user.update(admin_upgradation_params)
            redirect_to dashboard_path, notice: 'Successfully upgraded user to admin'
        else
            redirect_to dashboard_path, alert: 'Failed to upgrade user to admin'
        end
    end

    private
    def user_params
        params.require(:user).permit(:email, :first_name, :last_name, :mobile_no, :password, :password_confirmation, :is_admin, :is_buyer, :is_seller)
    end

    private
    def admin_upgradation_params
        params.permit(:is_admin, :is_buyer, :is_seller)
    end
end
