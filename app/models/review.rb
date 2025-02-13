class Review < ApplicationRecord
    belongs_to :user
    belongs_to :turf,optional: true
  
    validates :review, presence: true
end
