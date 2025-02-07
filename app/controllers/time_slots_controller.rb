class TimeSlotsController < ApplicationController

  before_action :set_time_slot, only: [:show,:edit,:update,:destroy]
  def index
    if params[:turf_id]
      turf = Turf.find_by_id(params[:turf_id])
      @time_slots =  turf ? turf.time_slots : []
    end
  end
    
  def show
    @time_slot = TimeSlot.find(params[:id])
  end

  def create
    # Rails.logger.info 

    @time_slot = TimeSlot.new(time_slot_params)
    @time_slot.status ||=0
    if @time_slot.save
      redirect_to turves_path, notice: "Time Slot Created Successfully"
    else
      render :new, status: :unprcoessable_entity,alert: "Error while creating Timeslot"
    end
  end

  def update
    if @time_slot.update(time_slot_params)
      redirect_to turves_path
    else
      render :edit
    end
  end

  def destroy
    if @time_slot.destroy
      redirect_to turves_path, notice: "TimeSlot Removed Successfully"
    else
      redirect_to turves_path,alert: "Error while Deleting the TimeSlot"
    end

    private

    def time_slot_params
      params.require(:time_slot).permit(:turf_id, :start_time, :end_time, :status )
    end

    def set_time_slot
      @time_slot = TimeSlot.find(params[:id])
    end
end
