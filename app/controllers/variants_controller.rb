class VariantsController < ApplicationController
    include ApplicationHelper
    before_action :authorized_only_to_admin!
    # before_action :get_variant, only: [:edit, :update, :destroy]
  
    def index
        @variants = Variant.all
    end
  
    def new
        @variant = Variant.new
    end
  
    def create
        @variant = Variant.new(model_params(:variant))
        if @variant.save
          redirect_to variants_path, notice: 'Variant added Succesfully'
        else
          render :new
        end
    end
  
    def edit
      @variant = Variant.find_by(id: params[:id])
    end
  
    def update
        @variant = Variant.find_by(id: params[:id])
        if @variant.update(model_params(:variant))
          redirect_to variants_path, notice: 'Variant has been succesfully Updated'
        else
          render :edit
        end
    end
  
    def destroy
        @variant = Variant.find_by(id: params[:id])
        @variant.destroy
        redirect_to variants_path, notice: 'Variant has been succesfully deleted'
    end
    
  end
  