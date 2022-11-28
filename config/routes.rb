Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "home#index"
  get "/car/details/:id", to:"home#show", as: :car_details
  get "/notification", to:"notification#index",  as: :notifications

  resources :users
  patch "/users/upgrade/:id", to:"users#admin_upgradation", as: :admin_upgradation

  resources :maps, only:[:new, :create, :index, :edit, :destroy, :update]
  get 'maps/tables', to:"maps#admin_index", as: :maps_table
  
  get '/:token/confirm_email/', :to => "users#confirm_email", as: 'confirm_email'

  get "/login", to:"sessions#new"
  post "/login", to:"sessions#create"
  delete "/logout", to:"sessions#destroy"
  get "/logout", to:"sessions#destroy_in_dashbaord"

  constraints SellerRouteConstraint.new do
    get "/dashboard", to:"seller_dashboard#index", as: :seller_dashboard
    get "/dashboard/appointments/list", to:"seller_dashboard#appointments_list", as: :seller_dashboard_appointments_list
    get "/dashboard/user/profile", to:"seller_dashboard#user_profile", as: :seller_dashboard_user_profile
    get "/dashboard/branches", to:"seller_dashboard#car_branches", as: :seller_dashboard_car_branches
    get "/dashboard/show/:id", to:"seller_dashboard#show", as: :seller_dashboard_details
    patch "/dashboard/edit", to:"seller_dashboard#update", as: :dashbaord_update
  end

  constraints BuyerRouteConstraint.new do
    get "/dashboard", to:"buyer_dashboard#index", as: :buyer_dashboard
    get "/dashboard/appointments/list", to:"buyer_dashboard#appointments_list", as: :buyer_dashboard_appointments_list
    get "/dashboard/user/profile", to:"buyer_dashboard#user_profile", as: :buyer_dashboard_user_profile
    get "/dashboard/branches", to:"buyer_dashboard#car_branches", as: :buyer_dashboard_car_branches
    get "/dashboard/show/:id", to:"buyer_dashboard#show", as: :buyer_dashboard_details
    patch "/dashboard/edit", to:"buyer_dashboard#update", as: :dashbaord_update_buyer
  end

  resources :cars, only:[:new, :create] do
    resource :appointment, only:[:new, :create]
  end

  # For admin
  scope module: 'admin' do
      resource :dashboard, only:[:show] do
        # resources :cars, only:[:create, :show, :destroy, :update] do
          resources :appointments, only:[:create, :index, :destroy, :update, :edit, :show]
        # end
      end
      get "/appointments/filter", to:"appointments#filter", as: :dashboard_appointments_filtered
      get "/dashboard/appointments/display/:id", to:"appointments#display", as: :user_details
      get "dashboard/edit/:partial", to:"dashboards#edit", as: :dashboard_edit
      patch "/appointment/approve/:id", to:"appointments#approve", as: :approve
      patch "/appointment/reject/:id", to:"appointments#reject", as: :reject
      patch "/dashboard/appointments/buyers/:id", to:"appointments#sold_update", as: :sold_update
      get "/appointment/buyers/:id", to:"appointments#buyers_list", as: :buyers_list
  end

  resources :cities
  resources :brands
  resources :models
  resources :years
  resources :variants
  resources :kilometers
  resources :states
  resources :conditions
end
