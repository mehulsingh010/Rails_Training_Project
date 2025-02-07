class TimeSlot < ApplicationRecord
  

  belongs_to :turf

  enum status: {available: 0,pending: 1,booked: 2}
  validates :start_time, presence: true
  validates :end_time, presence: true
  validates :status, presence: true
end
