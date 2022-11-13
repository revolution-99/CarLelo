class YearsController < ApplicationController
    include ApplicationHelper
    before_action :authorized_only_to_admin!
  
    def index
      @years = Year.all
    end
  
    def new
        @year = Year.new
    end
  
    def create
        @year = Year.create(year_params)
        if @year.save
            redirect_to years_path, notice: 'Year added Succesfully'
        else
            render :new
        end
    end
  
    def edit
        @year = Year.find_by(id: params[:id])
    end
  
    def update
        @year = Year.find_by(id: params[:id])
        if @year.update(year_params)
          redirect_to years_path, notice: 'Year has been succesfully Updated'
        else
          render :edit
        end
    end
  
    def destroy
        @year = Year.find_by(id: params[:id])
        @year.destroy
        redirect_to years_path, notice: 'Year has been succesfully deleted'
    end

    private
    def year_params
        params.require(:year).permit(:name)
    end
end
  