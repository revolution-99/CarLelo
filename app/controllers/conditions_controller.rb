class ConditionsController < ApplicationController
    include ApplicationHelper
    before_action :authorized_only_to_admin!
  
    def index
        @conditions = Condition.all
    end
  
    def new
        @condition = Condition.new
    end
  
    def create
        @condition = Condition.create(condition_params)
        if @condition.save
          redirect_to conditions_path, notice: 'Condition added Succesfully'
        else
          render :new
        end
    end
  
    def edit
        @condition = Condition.find_by(id: params[:id])
    end
  
    def update
        @condition = Condition.find_by(id: params[:id])
        if @condition.update(condition_params)
          redirect_to conditions_path, notice: 'Condition has been succesfully Updated'
        else
          render :edit
        end
    end
  
    def destroy
        @condition = Condition.find_by(id: params[:id])
        @condition.destroy
        redirect_to conditions_path, notice: 'Condition has been succesfully deleted'
    end
    
    private
    def condition_params
        params.require(:condition).permit(:condition, :cost)
    end
end
  