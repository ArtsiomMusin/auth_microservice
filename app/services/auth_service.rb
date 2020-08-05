class AuthService
  include ApiErrors
  prepend BasicService

  param :token

  attr_reader :user

  AUTH_TOKEN = %r{\ABearer (?<token>.+)\z}

  def call
    result = Auth::FetchUserService.call(extracted_token['uuid'])
    @user = result.user if result.success?
  end

  private

  def extracted_token
    JwtEncoder.decode(matched_token)
  rescue JWT::DecodeError
    {}
  end

  def matched_token
    result = @token.match(AUTH_TOKEN)
    return if result.blank?

    result[:token]
  end
end
