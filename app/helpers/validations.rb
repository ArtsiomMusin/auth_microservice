module Validations
  class InvalidParams < StandardError; end

  def validate_with!(validation, params:)
    result = validate_with(validation, params: params)
    raise InvalidParams if result.failure?

    result
  end

  def validate_with(validation, params:)
    contract = validation.new
    contract.call(params)
  end

  def validate_model_with(validation, params: params)
    result = validate_with(validation, params: params)
    return if result.success?

    result.errors.each do |error|
      self.errors.add(error.path.first, error.text)
    end
  end
end
