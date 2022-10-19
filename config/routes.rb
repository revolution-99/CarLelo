Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "home#index"
  get "/filter", to:"home#filter", as: :home_filtered
  get "/search", to:"home#search", as: :home_searched
  get "/car/details/:id", to:"home#show", as: :car_details
  get "/notification", to:"notification#index",  as: :notifications

  resource :users, only:[:new, :create, :show, :update]
  
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

  resources :cars, only:[:new, :create] do
    resource :appointment, only:[:new, :create]
  end

  # For admin
  namespace :admin do
      resource :dashboards, only:[:show] do
        resources :cars, only:[:create, :show, :destroy, :update] do
          resources :appointments, only:[:create, :index, :destroy, :update, :edit]
        end
      end

      get "dashboard/edit/:partial", to:"dashboards#edit", as: :dashboard_edit
      
  end
  resources :cities
  resources :brands
  resources :models
end
