class ModelsController < ApplicationController
    include ApplicationHelper
    before_action :authorized_only_to_admin!
    # before_action :get_model, only: [:edit, :update, :destroy]
  
    def index
      @models = Model.all
    end
  
    def new
        @model = Model.new
    end
  
    def create
        @model = Model.create(model_params)
        if @model.save
            redirect_to models_path, notice: 'Model added Succesfully'
        else
            render :new
        end
    end
  
    def edit
        @model = Model.find_by(id: params[:id])
    end
  
    def update
      @model = Model.find_by(id: params[:id])
      if @model.update(model_params)
        redirect_to models_path, notice: 'Model has been succesfully Updated'
      else
        render :edit
      end
    end
  
    def destroy
      @model = Model.find_by(id: params[:id])
      @model.destroy
      redirect_to models_path, notice: 'Model has been succesfully deleted'
    end
  
    # def get_model
    #   @model = Model.find(params[:id])
    # end

    private
    def model_params
        params.require(:model).permit(:name)
    end
  end
  