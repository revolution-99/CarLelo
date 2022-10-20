class StatesController < ApplicationController
    include ApplicationHelper
    before_action :authorized_only_to_admin!
    # before_action :get_state, only: [:edit, :update, :destroy]
  
    def index
        @states = State.all
    end
  
    def new
        @state = State.new
    end
  
    def create
        @state = State.new(model_params(:state))
        if @state.save
          redirect_to states_path, notice: 'State added Succesfully'
        else
          render :new
        end
    end
  
    def edit
      @state = State.find_by(id: params[:id])
    end
  
    def update
        @state = State.find_by(id: params[:id])
        if @state.update(model_params(:state))
          redirect_to states_path, notice: 'State has been succesfully Updated'
        else
          render :edit
        end
    end
  
    def destroy
        @state = State.find_by(id: params[:id])
        @state.destroy
        redirect_to states_path, notice: 'State has been succesfully deleted'
    end
    
  end
  