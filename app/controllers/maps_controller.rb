class MapsController < ApplicationController
    # before_action :authorized_only_to_admin!
  
    def index
      @maps = Map.all
    end
  
    def new
      @map = Map.new
    end
  
    def create
      @map = Map.new(map_params)
      if @map.save
        redirect_to maps_table_path, notice: 'Map record added Succesfully'
      else
        render :new
      end
    end

    def admin_index
      @maps = Map.all
    end

    def edit
      @map = Map.find_by(id: params[:id])
    end
  
    def update
      @map = Map.find_by(id: params[:id])
      if @map.update(map_params)
        redirect_to maps_table_path, notice: 'Map record has been succesfully Updated'
      else
        render :edit
      end
    end
  
    def destroy
      @map = Map.find_by(id: params[:id])
      @map.destroy
      redirect_to cities_path, notice: 'Map record has been succesfully deleted'
    end

    private
    def map_params
      params.require(:map).permit(:address, :latitude, :longitude)
    end
end
  