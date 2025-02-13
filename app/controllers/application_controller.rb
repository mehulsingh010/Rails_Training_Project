class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  include JwtToken

  # before_action :authenticate_user ,unless: :devise_controller?  # Ensure authentication for protected routes

  before_action :authenticate_request  # Apply JWT only for API calls
  before_action :configure_permitted_parameters, if: :devise_controller?
  # allow_browser versions: :modern
  # skip_before_action :verify_authenticity_token


  protect_from_forgery with:  :null_session
  
  protected

   # Allow additional parameters for Devise (Admin authentication)
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :phone_number, :role_id])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :phone_number, :role_id])
  end
  
 


  # Authenticate users using JWT (applies only to API routes
    def authenticate_request
      header = request.headers['Authorization']
      puts "HEADER IS : #{header}"
      token = header.split(' ').last if header.present?
      # puts "toekn is : #{token}"
      # debugger
      decoded = jwt_decode(token)
      puts "decoded token Is :#{decoded}"
      if decoded.nil?
        render json: {error: "Unauthorized access"}, status: :unauthorized
      else
        user_id = decoded[:user_id]
        role = decoded[:role]
        
        @current_user = User.find_by(id: user_id)
        if @current_user.nil?
          render json: { error: "User not found" }, status: :unauthorized 
        end
      end
    end

    # def api_request?
    #   request.path.start_with?("/api/")
    # end

end
