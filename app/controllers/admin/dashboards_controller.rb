module Admin
    class DashboardsController < ApplicationController
        before_action :authorized_only_to_admin!
        def show; end
    end
end
