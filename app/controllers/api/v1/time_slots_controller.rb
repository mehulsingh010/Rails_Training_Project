class Api::V1::TimeSlotsController < ApplicationController

  before_action :set_time_slot, only: [:show, :destroy, :update]
  def index
    if params[:turf_id].present?
      turf = Turf.find_by_id(params[:turf_id])
      @time_slots = turf ? turf.time_slots : []
      render json: { status: "Success" , timeSlots: {data: @time_slots}}
    end
  end

  def show
    render json: {status: "Success",data: @time_slot}
  end

  def create 
    @time_slot = TimeSlot.new(time_slot_params)
    if @time_slot.save
      render json: {status: "Success",message: "TimeSlot Created Succesfully",data: @time_slot}
    else
      render json: {status: "Error",message: "TimeSlot Not Created", error: @time_slot.errors.full_messages}
    end
  end

  def update
    if  @time_slot.update(time_slot_params)
      render json: {status: "Success", message: "TimeSlots updated successfully",data: @time_slot}
    else 
      render json: {status: "Error",message: "Errors While Updating the TimeSlot",error: @time_slot.errors.full_messages},status: :unprocessable_entity
    end
  end

  def destroy
    if @time_slot.destroy
      render json: { status: "Success", message: "TimeSlot Deleted Successfully" }
    else
      render json: { status: "Error", message: "Error While Deleting TimeSlot" }, status: :unprocessable_entity
    end
  end

  private 
  def set_time_slot
    @time_slot = TimeSlot.find(params[:id])

  end


  def time_slot_params
    params.require(:time_slot).permit([:start_time, :end_time, :turf_id, :status])
  end
end
