class Api::V1::TurvesController < ApplicationController

    before_action :set_turf , only: [:show, :update, :destroy]

    def index
        @turves = Turf.all
        render json: @turves,status: 200
    end                
                                                        
    def show
        if @turf
            render json: @turf,status: 200
        else
            render json: {error: "Turf Not Found"}, status: 400
        end
    end 
  
    def create
        @turf = Turf.new(turf_params)
        if @turf.save
            render json: {status: "Success", message: "Turf Created Successfully.",data: @turf}
        else 
            render json: {status: "Error",message: "User not created" ,erorr: @turf.errors.full_message},status: :unprcoessable_entity
        end
    end

    def update
        if @turf.update(turf_params)
            render json: {status: "Success", message: "Turf Details Updated Successfully",data: @turf}
        else
            render json: {status: "Error",message: "Errors While Updating Turf Details",error: @turf.errors.full_message}, status: :unprcoessable_entity
        end
    end

    def destroy
        if @turf.destroy
            render json: {status: "Success", message: "Turf Deleted Successfully",data: @turf}
        else
            render json:{status: "Error",message: "Error In Deleting Turf",errors: @turf.errors.full_messages}
        end
    end
            
    def set_turf
        @turf = Turf.find(params[:id])
    end

    def turf_params
        # debugger
      params.require(:turf).permit([:name ,:location ,:opening_time, :close_time, :status ,:user_id])
    end
end
