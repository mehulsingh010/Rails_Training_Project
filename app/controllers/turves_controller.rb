class TurvesController < ApplicationController

    before_action :set_user , only: [:show, :edit, :update, :destroy]

    def index
        @turves  = Turf.all
    end

    def new
        @turf = Turf.new
    end

    def edit
    end

    def show
    end

    def create
        @turf = Turf.new(turf_params)
        if @turf.save 
            redirect_to turves_path, notice: "Turf was Successfully created"
        else 
            render :new, status: :unprocessable_entity, alert: "Error While Creating New Turf"
        end
    end

    def update
        if @turf.update(turf_params)
            redirect_to turves_path
        else 
            render :edit
        end
    end

    def destroy 
        if @turf.destroy
            redirect_to turves_path, notice: "Turf was successfully deleted"
        else
            redirect_to turves_path, alert: "There was problemn deleting turf"
        end
    end

    def set_user
        @turf = Turf.find(params[:id])
    end

    def turf_params
        params.require(:turf).permit(:name, :location, :opening_time, :close_time, :status, :user_id)

    end
end
