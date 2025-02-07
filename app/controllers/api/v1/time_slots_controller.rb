class Api::V1::TimeSlotsController < ApplicationController

  before_action :set_time_slot, only: [:show, :destroy, :update]
  def index
    if params[:turf_id]
      turf = Turf.find_by_id(params[:turf_id])
      @time_slots = turf ? turf.time_slots : []
      render json: { status: "Success" , timeSlots: {data: @time_slots}}
    end
  end

  def show
    @time_slot = TimeSlot.find(params[:id])
  end

  def create 
    @time_slot = TimeSlot.new(time_slot_params)
    if @time_slot.save
      render json: {status: "Success",message: "TimeSlot Created Succesfully",data: @time_slot}
    else
      render json: {status: "Error",message: "TimeSlot Not Created", error: @time_slot.errors.full_message}
    end
  end

  def update
    if  @time_slot.update(time_slot_params)
      render json: {status: "Success", message: "TimeSlots updated successfully",data: @time_slot}
    else 
      render json: {status: "Error",message: "Errors While Updating the TimeSlot",error: @time_slot.errors.full_message},status: :unprocessable_entity
    end
  end

  def destroy
    @time_slot.destroy
  end

  private 
  def set_time_slot
    @time_slot = TimeSlot.find(params[:id])

  end


  def time_slot_params
    params.require(:time_slot).permit([:time_slot_id, :start_time,:end_time,:turf_id,:status])
  end
end
