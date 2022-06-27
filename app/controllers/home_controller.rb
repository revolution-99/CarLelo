class HomeController < ApplicationController
  
  def index
    @cars = Car.all
  end

  def filter
    @cars = Car.where(nil)
    filtering_params(params).each do |key, value|
      @cars = @cars.public_send("filter_by_#{key}", value) if value.present?
    end
  end
  

  private
  def filtering_params(params)
    params.slice(:city, :year, :km, :brand, :model, :state, :variant)
  end
  
end
