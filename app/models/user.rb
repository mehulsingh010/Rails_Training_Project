class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         
    #   has_many measn that the user model has many reviews
    has_many :reviews
    has_many :bookings
      
    #  belongs_to means that the user model belongs to the role model 
    belongs_to :role  
    belongs_to :turf, dependent: :destroy ,optional: true # optional true means a user can optionally nelongs to one turf 

   
    
    enum status: {active: 0,inactive: 1}

    def deactivate 
      update(status: :inactive)
    end

    def reactivate
      update(status: :active)
    end

      #validating fields
    validates :name, presence: true, length: { maximum: 50 }
    validates :phone_number, presence: true, length: { is: 10 }
    validates :role_id, presence: true
   
end
      