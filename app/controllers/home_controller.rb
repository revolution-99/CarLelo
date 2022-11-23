class HomeController < ApplicationController
  skip_before_action :require_login
  before_action :authorized_only_to_users!, only:[:show]
  
  def index
    @brands = Brand.joins(:models).distinct
    @cars = Car.joins(:appointments).where('is_approved=true AND status=3').distinct
    # @conditions = Condition.joins("INNER JOIN cars ON cars.condition = conditions.condition")
    @q = params[:search_query]
    @cars = Car.search(@q, fields: ['city', 'year', 'km', 'brand', 'model', 'state', 'variant'], match: :word_middle) if @q
    
    filtering_params(params).each do |key, value|
      if value.present? & @q
        @cars = Car.search(@q, fields: ['city', 'year', 'km', 'brand', 'model', 'state', 'variant'], match: :word_middle, scope_results: ->(r) { r.public_send("filter_by_#{key}", value)})
      else
        @cars = Car.public_send("filter_by_#{key}", value)
      end
    end
  end

  def show
    @car = Car.find_by(id: params[:id])
    @appointment = Appointment.find_by(car_id: @car.id)
    @apps = Appointment.where(car_id: @car.id).joins(:user).where('is_buyer=true')
    @flag = false
    @apps.each do |app|
      if app.user_id == current_user.id
        @flag = true
      end
    end 
  end

  def filter
    @brands = Brand.joins(:models).distinct
    @cars = Car.joins(:appointments).where('is_approved=true').distinct
    filtering_params(params).each do |key, value|
      @cars = @cars & @cars.public_send("filter_by_#{key}", value) if value.present?
    end
    # binding.pry
    # @conditions = Condition.joins("INNER JOIN cars ON cars.condition = conditions.condition")
  end
  
  def search
    @brands = Brand.joins(:models).distinct
    @q = params[:search_query]
    @cars = Car.joins(:appointments).where('is_approved=true').distinct & Car.search(@q, fields: ['city', 'year', 'km', 'brand', 'model', 'state', 'variant'], match: :word_middle) if @q
    @conditions = Condition.joins("INNER JOIN cars ON cars.condition = conditions.condition")
    # binding.pry
  end

  private
  def filtering_params(params)
    params.slice(:city, :year, :km, :brand, :model, :state, :variant)
  end
end
