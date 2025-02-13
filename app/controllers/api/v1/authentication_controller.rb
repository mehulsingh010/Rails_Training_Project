module Api
    module V1
        class AuthenticationController < ApplicationController
          include JwtToken
          skip_before_action :authenticate_request, only: [:login]
          # skips the authenticate_user for login request

          #post /auth/login

          def login
            # --finds the user by email
            @user = User.find_by_email(params[:email])   

            #  --checks if the password is correct using valid_password?
            if @user&.valid_password?(params[:password])
                # --generate a JWT token upon successfully login
                token = jwt_encode(user_id: @user.id, role: @user.role.name)
                render json: {token: token},status: :ok                
            else
                render json: {error: 'unauthorized' }, status: :unauthorized
            end
          end  

          def signup
            
            
          end
        end
    end
end

