require "jwt"

module JwtToken

    extend ActiveSupport::Concern
    SECRET_KEY = Rails.application.credentials.secret_key_base

    def jwt_encode(payload, exp = 7.days.from_now)
        payload[:exp] = exp.to_i
        JWT.encode(payload, SECRET_KEY)
    end


    def jwt_decode(token)
        return nil if token.nil?  # Prevent decoding nil token
        
        decoded = JWT.decode(token, SECRET_KEY)[0]
        HashWithIndifferentAccess.new decoded
        rescue JWT::DecodeError => e
        Rails.logger.error "JWT Decode Error: #{e.message}"
        nil  # Return nil instead of throwing an error
    end
end