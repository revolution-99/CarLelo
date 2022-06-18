Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "home#index"

  get "/users", to:"users#new"
  post "/users", to:"users#create"
  
  get '/:token/confirm_email/', :to => "users#confirm_email", as: 'confirm_email'

  get "/login", to:"sessions#new"
  post "/login", to:"sessions#create"
  delete "/logout", to:"sessions#destroy"

  constraints SellerRouteConstraint.new do
    get "/dashboard", to:"seller_dashboard#new", as: :seller_dashboard
    get "/dashboard/edit", to:"seller_dashboard#edit"
  end
  get "/dashboard", to:"buyer_dashboard#new", as: :buyer_dashboard 

  get "/sell_used_car", to:"sell_used_car#new"
  # get "/sell_used_car/edit", to:"sell_used_car#edit", as: :sell_used_car_edit
  post "/sell_used_car", to:"sell_used_car#create"

  get "/appointment", to:"appointment#new"
  post "/appointment", to:"appointment#create"

end
