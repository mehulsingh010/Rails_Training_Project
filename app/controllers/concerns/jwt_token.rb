require "jwt"

# handling the encoding and decoding of token
module JwtToken

    extend ActiveSupport::Concern   
    # Rails module that makes it easier to include instance methods & class methods in another class.
    SECRET_KEY = Rails.application.credentials.secret_key_base
    
  
    def jwt_encode(payload, exp = 2.days.from_now)
        payload[:exp] = exp.to_i
        JWT.encode(payload, SECRET_KEY)
    end


    def jwt_decode(token)
        return nil if token.nil?  # Prevent decoding nil token
        
       
        decoded = JWT.decode(token, SECRET_KEY,true,algorithm: 'HS256')[0]
        unless JWT.encode(decoded, SECRET_KEY,'HS256') == token
            raise JWT::VerificationError, "Token signature mismatch!"
        end
        return HashWithIndifferentAccess.new(decoded)
        #return decoded
        rescue JWT::DecodeError => e
            
        Rails.logger.error "JWT Decode Error: #{e.message}"
        nil  # Return nil instead of throwing an error
    end
end