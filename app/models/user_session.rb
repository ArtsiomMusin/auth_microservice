class UserSession < Sequel::Model
  include Validations
  many_to_one :user

  def validate
    super

    #validates_presence :uuid, message: I18n.t(:blank, scope: 'model.errors.user_session.uuid')
    validate_model_with(SessionContract, params: values.slice(:uuid))
  end
end
