class Booking < ApplicationRecord
    belongs_to :time_slot
    belongs_to :user
    belongs_to :turf

    validates :time_slot_id , presence:true, uniqueness: true    
end
  