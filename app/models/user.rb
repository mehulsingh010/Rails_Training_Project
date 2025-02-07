class User < ApplicationRecord
    #   has_many measn that the user model has many reviews
    has_many :reviews
    has_many :bookings
      
    #  belongs_to means that the user model belongs to the role model 
    belongs_to :role  
    belongs_to :turf, optional: true # optional true means a user can optionally nelongs to one turf 

    #for password handling
    has_secure_password
    
    #validating fields
    validates :name, presence: true, length: { maximum: 50 }
    validates :email, presence: true, uniqueness: true, format: {with: URI::MailTo::EMAIL_REGEXP}
    validates :password, presence: true, length: {in: 6..20 }
    validates :phone_number, presence: true, length: { is: 10 },numericality: { only_integer: true }
   
end
      