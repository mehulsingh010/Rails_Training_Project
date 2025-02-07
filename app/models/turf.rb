class Turf < ApplicationRecord
    has_many :reviews
    has_many :time_slots
    belongs_to :user 
    has_many :bookings
  

    validates :name, presence: true, length: { maximum: 50 }
    validates :image, presence: false
    validates :location,presence: true
    validates :opening_time,presence: true
    validates :close_time,presence: true
    validates :status,presence: true ,inclusion: { in: [true, false] }
  
  end
  