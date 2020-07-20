require 'sinatra/extension'

module Auth
  extend Sinatra::Extension

  AUTH_TOKEN = %r{\ABearer (?<token>.+)\z}

  #set :current_user

  helpers do
    def auth_user
      result = Auth::FetchUserService.call(extracted_token['uuid'])

      if result.success?
        @current_user = result.user
      else
        error_response(result.errors, :forbidden)
      end
    end

    def extracted_token
      JwtEncoder.decode(matched_token)
    rescue JWT::DecodeError
      {}
    end

    def matched_token
      result = auth_header&.match(AUTH_TOKEN)
      return if result.blank?

      result[:token]
    end

    def auth_header
      request.headers['Authorization']
    end
  end
end
