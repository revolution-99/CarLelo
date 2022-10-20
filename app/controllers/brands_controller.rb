class BrandsController < ApplicationController
    include ApplicationHelper
    before_action :authorized_only_to_admin!
    # before_action :get_brand, only: [:edit, :update, :destroy]
  
    def index
        @brands = Brand.all
    end
  
    def new
        @brand = Brand.new
    end
  
    def create
        @brand = Brand.new(model_params(:brand))
        if @brand.save
          redirect_to brands_path, notice: 'Brand added Succesfully'
        else
          render :new
        end
    end
  
    def edit
      @brand = Brand.find_by(id: params[:id])
    end
  
    def update
        @brand = Brand.find_by(id: params[:id])
        if @brand.update(model_params(:brand))
          redirect_to brands_path, notice: 'Brand has been succesfully Updated'
        else
          render :edit
        end
    end
  
    def destroy
        @brand = Brand.find_by(id: params[:id])
        @brand.destroy
        redirect_to brands_path, notice: 'Brand has been succesfully deleted'
    end
    
  end
  