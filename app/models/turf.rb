class Turf < ApplicationRecord
    has_many :reviews
    has_many :time_slots
    belongs_to :user 
    has_many :bookings
  
    enum status: { closed: 0, open: 1 }
    validates :name, presence: true, length: { maximum: 50 }
    validates :image, presence: false
    validates :location,presence: true
    validates :opening_time,presence: true
    validates :close_time,presence: true
    validate :validate_timing_order

    # validates :status,presence: true ,inclusion: { in: [true, false] }

    def validate_timing_order
    if opening_time >= close_time
      errors.add(:base, "Opening time must be before closing time")
    end
  end
  end
  