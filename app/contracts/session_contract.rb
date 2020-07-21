class SessionContract < Dry::Validation::Contract
  params do
    required(:uuid).filled(:string)
  end
end
