class SellerRouteConstraint
    def matches?(request)
        user = current_user(request)
        user.present? && user.is_seller == true
    end

    def current_user(request)
         User.find_by_id(request.session[:user_id])
    end
end