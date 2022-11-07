# require 'pry'
class HomeController < ApplicationController
  skip_before_action :require_login
  before_action :authorized_only_to_users!, only:[:show]
  
  def index
    @brands = Brand.joins(:models).distinct
    @cars = Car.joins(:appointments).where('is_approved=true').distinct
  end

  def show
    @car = Car.find_by(id: params[:id])
    @appointment = Appointment.find_by(car_id: @car.id)
  end

  def filter
    @brands = Brand.joins(:models).distinct
    @cars = Car.joins(:appointments).where('is_approved=true').distinct
    filtering_params(params).each do |key, value|
      @cars = @cars.public_send("filter_by_#{key}", value) if value.present?
    end
  end
  
  def search
    @brands = Brand.joins(:models).distinct
    @q = params[:search_query]
    @cars = Car.joins(:appointments).where('is_approved=true').distinct & Car.search(@q, fields: ['city', 'year', 'km', 'brand', 'model', 'state', 'variant']) if @q
    # binding.pry
  end

  private
  def filtering_params(params)
    params.slice(:city, :year, :km, :brand, :model, :state, :variant)
  end
end
