Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "home#index"
  get "/filter", to:"home#filter", as: :home_filtered
  get "/search", to:"home#search", as: :home_searched
  get "/notification", to:"notification#index",  as: :notifications


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
    # get "/verification", to:"seller_dashboard#verify_password"
  end

  # constraints BuyerRouteConstraint.new do
    get "/dashboard", to:"buyer_dashboard#new", as: :buyer_dashboard 
    get "/dashboard/edit/:partial", to:"buyer_dashboard#edit", as: :buyer_dashboard_edit
    patch "/dashboard/edit", to:"buyer_dashboard#update", as: :dashbaord_update_buyer
  # end


  get "/sell_used_car", to:"sell_used_car#new"
  post "/sell_used_car", to:"sell_used_car#create"

  get "/appointment", to:"appointment#new"
  post "/appointment", to:"appointment#create"


  # For admin
  namespace :admin do
      get "dashboard", to:"dashboard#new"
      post "dashboard/car", to:"car#create"
      get "update/car/:id", to:"car#show"
      patch "update/car/:id", to:"car#update", as: :update_car

      # post "dashboard/appointment", to:"appointment#create"
      patch "update/appointment/:id", to:"appointment#update", as: :update_appointment
      delete "delete/appointment/:id", to:"appointment#delete", as: :delete_appointment
      
      get "dashboard/edit/:partial", to:"dashboard#edit", as: :dashboard_edit
      delete "delete/car/:id", to:"car#delete", as: :delete_car
  end
end
