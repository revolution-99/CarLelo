class HomeController < ApplicationController
  skip_before_action :require_login
  before_action :authorized_only_to_users!, only: [:show]
  
  def index
    @brands = Brand.joins(:models).distinct
    @cars = Car.joins(:appointments).where('is_approved=true AND status=3').distinct
    @q = params[:search_query]
    
    args = {}
    args[:city] = params[:city] if params[:city].present?
    args[:year] = params[:year] if params[:year].present?
    args[:km] = params[:km] if params[:km].present?
    args[:brand] = params[:brand] if params[:brand].present?
    args[:model] = params[:model] if params[:model].present?
    args[:state] = params[:state] if params[:state].present?
    args[:variant] = params[:variant] if params[:variant].present?

    if @q.present?
      @cars &= Car.search(@q.upcase, fields: ['city', {'year': 'exact'}, 'km', 'brand', 'model', {'state': 'exact'}, 'variant'], match: :word_middle, where: args, aggs: { city: {}, year: {}, km: {}, brand: {}, model: {}, state: {}, variant: {} },misspellings: {below: 2})
    else
      filtering_params(params).each do |key, value|
        @cars &= Car.public_send("filter_by_#{key}", value) if value.present?
        @cars = Car.where(id: @cars.map(&:id))
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

  private
  def filtering_params(params)
    params.slice(:city, :year, :km, :brand, :model, :state, :variant)
  end
end
