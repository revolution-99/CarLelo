class SellerDashboardController < ApplicationController
    # before_action :require_password
    protect_from_forgery except: :dashboard_edit

    def new
        
    end

    # def require_password
        
    # end
    def edit
        respond_to do |format|
            # format.html{}
            format.js 
        end
    end
end