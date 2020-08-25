module JwtEncoder
  extend self

  HMAC_SECRET = ENV.fetch('HMAC_SECRET') { 'some secret key here' }

  def encode(payload)
    JWT.encode(payload, HMAC_SECRET)
  end

  def decode(token)
    JWT.decode(token, HMAC_SECRET).first
  end
end
