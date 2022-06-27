Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "home#index"
  get "/filter", to:"home#filter", as: :home_filtered


  get "/users", to:"users#new"
  post "/users", to:"users#create"
  
  get '/:token/confirm_email/', :to => "users#confirm_email", as: 'confirm_email'

  get "/login", to:"sessions#new"
  post "/login", to:"sessions#create"
  delete "/logout", to:"sessions#destroy"
  get "/logout", to:"sessions#destroy_in_dashbaord"

  constraints SellerRouteConstraint.new do
    get "/dashboard", to:"seller_dashboard#new", as: :seller_dashboard
    get "/dashboard/edit/:partial", to:"seller_dashboard#edit", as: :seller_dashboard_edit
    patch "/dashboard/edit", to:"seller_dashboard#update", as: :dashbaord_update
    # post "/dashboard/update/mobile", to:"seller_dashboard#mobile_update"
  end
  get "/dashboard", to:"buyer_dashboard#new", as: :buyer_dashboard 
  get "/dashboard/edit/:partial", to:"buyer_dashboard#edit", as: :buyer_dashboard_edit
  patch "/dashboard/edit", to:"buyer_dashboard#update", as: :dashbaord_update_buyer



  get "/sell_used_car", to:"sell_used_car#new"
  post "/sell_used_car", to:"sell_used_car#create"

  get "/appointment", to:"appointment#new"
  post "/appointment", to:"appointment#create"

end
