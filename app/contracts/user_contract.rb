class UserContract < Dry::Validation::Contract
  params do
    required(:name).filled(:string)
    required(:email).filled(:string)
  end

  rule(:name) do
    key.failure(I18n.t(:invalid, scope: 'model.errors.user.name')) unless %r{\A\w+\z}.match?(value)
  end
end
