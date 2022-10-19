class CitiesController < ApplicationController
    include ApplicationHelper
    before_action :authorized_only_to_admin!

    # before_action :get_city, only: [:edit, :update, :destroy]
  
    def index
      @cities = City.all
    end
  
    def new
      @city = City.new
    end
  
    def create
      @city = City.new(model_params(:city))
      if @city.save
        redirect_to cities_path, notice: 'City added Succesfully'
      else
        render :new
      end
    end
  
    def edit
      @city = City.find_by(id: params[:id])
    end
  
    def update
      @city = City.find_by(id: params[:id])
      if @city.update(model_params(:city))
        redirect_to cities_path, notice: 'City has been succesfully Updated'
      else
        render :edit
      end
    end
  
    def destroy
      @city = City.find_by(id: params[:id])
      @city.destroy
      redirect_to cities_path, notice: 'City has been succesfully deleted'
    end
  
    # def get_city
    #   @city = City.find(params[:id])
    # end
    
  end
  