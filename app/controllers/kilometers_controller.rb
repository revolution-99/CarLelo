class KilometersController < ApplicationController
    include ApplicationHelper
    before_action :authorized_only_to_admin!
    # before_action :get_kilometer, only: [:edit, :update, :destroy]
  
    def index
        @kilometers = Kilometer.all
    end
  
    def new
        @kilometer = Kilometer.new
    end
  
    def create
        @kilometer = Kilometer.new(model_params(:kilometer))
        if @kilometer.save
          redirect_to kilometers_path, notice: 'Kilometer added Succesfully'
        else
          render :new
        end
    end
  
    def edit
      @kilometer = Kilometer.find_by(id: params[:id])
    end
  
    def update
        @kilometer = Kilometer.find_by(id: params[:id])
        if @kilometer.update(model_params(:kilometer))
          redirect_to kilometers_path, notice: 'Kilometer has been succesfully Updated'
        else
          render :edit
        end
    end
  
    def destroy
        @kilometer = Kilometer.find_by(id: params[:id])
        @kilometer.destroy
        redirect_to kilometers_path, notice: 'Kilometer has been succesfully deleted'
    end
    
  end
  