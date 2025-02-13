class TimeSlot < ApplicationRecord
  

  belongs_to :turf

  enum status: {available: 0,notAvailable: 1,booked: 2}
  validates :start_time, presence: true
  validates :end_time, presence: true
  validates :status, presence: true
  validate :validate_time_slot_within_turf_hours
  validate :validate_no_duplicate_slots
  validate :validate_one_hour_slot

  before_validation :set_default_status

  # Ensure time slot is within Turf's operating hours
  def validate_time_slot_within_turf_hours
    return unless turf  # Ensure Turf exists before checking

    # turf_start_time = turf_id.start_time
    # turf_end_time = turf_id.end_time

    if start_time < turf.opening_time || end_time > turf.close_time
      errors.add(:base, "Time slot must be within Turf's operating hours (#{turf.opening_time.strftime('%I:%M %p')} - #{turf.close_time.strftime('%I:%M %p')})")
    end
  end

  # Ensure no duplicate time slots exist for the same Turf on the same date
  def validate_no_duplicate_slots
    existing_slot = TimeSlot.where(
      turf_id: turf_id,
      start_time: start_time
      #  start_time: opening_time.beginning_of_hour..close_time.end_of_hour
    ).exists?

    errors.add(:base, "Time slot already exists for this Turf at this time") if existing_slot
  end


  def validate_one_hour_slot
    if (end_time - start_time) != 1.hour
      errors.add(:base, "Each time slot must be exactly 1 hour long")
    end
  end


  # Set default status if not provided
  def set_default_status
    current_time = Time.current

    if current_time >= turf.opening_time && current_time <= turf.close_time
      self.status = 0 # Set to "avilabel" if current time is within the slot range
    else
      self.status = 1 
    end
  end
end
